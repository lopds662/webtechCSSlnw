
$(document).ready(function(){
 
    var html = '<table class="table table-hover table-bordered"><thead><tr><th><input type="checkbox" id="select_all" value="" onclick="toggleCheck()"> All</th><th>Username ID</th><th>Firstname</th><th>Lastname</th><th>Role</th><th></th></tr></thead><tbody>';

    $.ajax({
    type: "POST",
    url: "controller/switcher.php",
    data: {
        func: "get_user"
        },
    success: function(data) {
        var obj = JSON.parse(data);
        for (var i = 0, len = obj.length; i < len; ++i) {
        var objIn = obj[i];
        html += '<tr>';
        html += '<td><input class="childbox" type="checkbox" value=""></td><td>' + objIn['username'] + '</td><td>' + objIn['firstname'] + '</td><td>' + objIn['lastname'] + '</td><td>' + objIn['role'] + '</td>';
        html += '<td><input type="button" id="edit"  value="" onclick="editTable(this)" alt="Edit" data-toggle="modal" data-target="#editModal"><input type="button" id="delete" alt="Delete" data-toggle="modal" data-target="#deleteModal" value=""></td>';
        html += "</tr>";
}
html += '</tbody><tfoot><tr></tr></tfoot></table>';
  $(html).appendTo('#table');          
            
    },
    error: function(data) {
        alert("error "+data);
    }

}); 
    
});


    
function editTable(button) {
    var currentID = $(button).parents('tr').find('td');
    $("#usr").val(currentID.eq(1).html());
    $("#firstname").val(currentID.eq(2).html());
    $("#lastname").val(currentID.eq(3).html());
    $("#role").val(currentID.eq(4).html());
}
  



function toggleCheck(){
    var parBox = document.getElementById('select_all');
    if(parBox.checked == true){
        var chbox = document.getElementsByClassName('childbox');
        for(var i = 0, len = chbox.length; i < len; ++i){
            chbox[i].checked = true;
        }  
    }
    else{
        var chbox = document.getElementsByClassName('childbox');
        for(var i = 0, len = chbox.length; i < len; ++i){
            chbox[i].checked = false;
        }
    }
    
}




   
