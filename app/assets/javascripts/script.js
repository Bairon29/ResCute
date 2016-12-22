$(document).ready(function(){

$('#test').on('click', function(){
  console.log('asdf')
  $.ajax({
    url: '/test',
    method: 'get'
  }).done(function(data){
    console.log(data)
  })
})
})
