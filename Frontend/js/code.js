var cmbCampos = document.getElementById('cmbCampos');
var parametro = document.getElementById('parametro');
cmbCampos.onchange = function(e){
    if(cmbCampos.value !== "todas_las_provincias"){
        parametro.type = "text"
    }
    else{
        parametro.type = "hidden"
    }
}

getProvincias();
getProvinciaId(5);
getProvinciaName('Azuay');
getProvinciaPlot('contagiados');
function getProvincias(){
    fetch('http://127.0.0.1:7721/provincias')
    .then(response => response.json())
    .then(json =>{
        json.forEach(element => {
            console.log(element);//aqui llenas el combo
        });
    })
    
}
function getProvinciaId(id){
    fetch('http://127.0.0.1:7721/provincia_id?id='+id)
    .then(response => response.json())
    .then(json =>{
        console.log(json[0]);
    })
}
function getProvinciaName(name){
    fetch('http://127.0.0.1:7721/provincia_name?name='+name)
    .then(response => response.json())
    .then(json =>{
        console.log(json[0]);
    })
}
function getProvinciaPlot(campo){
    document.getElementById('imgPlot')
    .setAttribute("src", "http://127.0.0.1:7721/plot_provincia?campo="+campo);
}