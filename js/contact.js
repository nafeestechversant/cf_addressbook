function confirmDelete(pageID)
{
   if(window.confirm('Are you sure you want to delete this Contact?'))
   {
      window.location.href = 'index.cfm?From=Delete&ID='+pageID;
   }
   else
   {
      null;
   }
}
function viewContact(contactID)
{
    window.location.href = 'index.cfm?From=View&ID='+contactID; 
     
}
function readURL(input) 
{
    if (input.files && input.files[0]) {
      var reader = new FileReader();
  
      reader.onload = function (e) {
        $('#cnt-img').attr('src', e.target.result).width(150).height(200);
      };
  
      reader.readAsDataURL(input.files[0]);
    }
}

$('.btn-action-edit').click(function(){
   var contact_id = $(this).data('id');   
   $.ajax({
      type:"POST",
      url:"login.cfc?method=getContactBy",      
      data: "contact_id="+contact_id,
      dataType: "json",
      cache:false,
      success: function(data) {
         $('#cont_title :selected').text(data[0].TITLE);
         $('#cont_firstname').val(data[0].FIRSTNAME);
         $('#cont_lastname').val(data[0].LASTNAME);
         $('#cont_gender :selected').text(data[0].GENDER);
         $('#cont_dob').val(data[0].DATEOF_BIRTH);
        // $('#cont_photo').val(data[0].CONTACT_IMAGE);
         $('#cont_addr').val(data[0].ADDRESS);
         $('#cont_street').val(data[0].STREET);
         $('#cont_pin').val(data[0].PINCODE);
         $('#cont_email').val(data[0].CONTACT_EMAIL);
         $('#cont_phone').val(data[0].CONTACT_PHONE);
         $('#cont_id').val(data[0].CONTACT_ID);
         console.log(data);
         
      }
  });
});