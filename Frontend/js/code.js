var cmbCampos = document.getElementById('cmbCampos');
var imagenPlot = document.getElementById('imgPlot');
var contentData= document.getElementById('contentData');
var lista_plot= document.getElementById('lista_plot');
getProvincias();
cmbCampos.onchange = function(e){
    if(cmbCampos.value !== "todas_las_provincias"){
        getProvinciaId(cmbCampos.value);
        contentData.style.display = 'block';
        imagenPlot.style.display = 'none';
        lista_plot.style.display = 'none';
    }
    else {
        contentData.style.display = 'none';
        imagenPlot.style.display = 'block';
        lista_plot.style.display = 'block';
    }
}

function getProvincias(){
    fetch('http://127.0.0.1:3731/provincias')
    .then(response => response.json())
    .then(json =>{
        json.forEach(element => {
            var option = document.createElement("option");
            option.value=element.idprovincia;
            option.text=element.provincia
            cmbCampos.appendChild(option);
        });
    })
    
}
function getProvinciaId(id){
    fetch('http://127.0.0.1:3731/provincia_id?id='+id)
    .then(response => response.json())
    .then(json =>{
        contentData.innerHTML="<b>"+json[0].provincia+"</b><br>"+
        "superficie: "+json[0].superficie+"<br>"+
        "hombres: "+json[0].hombres+"<br>"+
        "mujeres: "+json[0].mujeres+"<br>"+
        "problacion_total: "+json[0].problacion_total+"<br>"+
        "contagiados: "+json[0].contagiados+"<br>"+
        "recuperados: "+json[0].recuperados+"<br>"+
        "fallecidos: "+json[0].fallecidos+"<br>";
    })
}
function getProvinciaPlot(campo){
    imagenPlot.setAttribute("src", "http://127.0.0.1:3731/plot_provincia?campo="+campo);
}