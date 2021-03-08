<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./base.jsp"%>
<meta charset="ISO-8859-1">

<style >

body{

background-color:#fdfdfd8c;
font-family: fangsong;


}

</style>
</head>
<body>
	<div class="container mt-5" style="width: 50%;">
		<div class="card col-md" style="    margin: 6px;
    padding: 7px;width: 100%;">
	        	 
		 
			<div>
				<span> <input type="text" id="searchBar" placeholder="Search By Barcode" style="width: 30%; margin: 10px;margin-left: 1px; ">
					
						
				<!-- Button trigger modal -->
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="display" style="margin-left: 344px;">
           Details
          </button>

													<!-- Modal -->
     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
       		<div class="modal-dialog" role="document">
         		<div class="modal-content">
           			<div class="modal-header">
             <!-- <h5 class="modal-title" id="exampleModalLabel">Sales</h5> -->
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            		<span aria-hidden="true">&times;</span>
            </button>
            		</div>
         	<div class="modal-body">
         
              <table class="table" id="example" style="width:100%;">
                  <thead>
                    <tr>
                          <th scope="col" ></th>
      					  <th scope="col">Prefix</th>
     					  <th scope="col">Total</th>
    			    </tr>
  				  </thead>
  				  <tbody></tbody>
			 </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      
      </div>
    </div>
  </div>
</div>
				
				
				</span>
			</div>
               
        <form action="/saveSales" enctype="multipart/form-data" method="post" id="form1" >
		     <input type="hidden" name="prefix" value="ORD">
			<div>
				<table class="table" style="margin-top:10px;"  border="1" id="myTable">
					<thead>
						<tr style="color: darkblue;">
						<!-- 	<th scope="col" style="visibility: hidden"></th> -->
							<th scope="col">Products</th>
							<th scope="col">Quantity</th>
							<th scope="col">Price</th>
						<!-- 	<th scope="col" style="visibility: hidden"></th> -->
						</tr>
					</thead>

    
					 <tbody id="records_table" style="    color: blue;">
					</tbody> 
				</table>
				
			</div>
		
			 <div><span> <button type="submit" class="btn btn-primary" id="submitBtn" style=" display:inline;"> submit</button>
			 <label style="margin-left: 278px;" id="label"><b>Total:</b></label><input  id="total" name="total" value="" style="margin-left: 3px;  display:inline;   margin-bottom: 26px; width: 14%;
    padding: 10px;" ></span></div>
			  
			
		 </form> 
		</div>
	</div>


	<script>
	 var tabling = {
	            init:function(){
	           	 table = $('#example').DataTable({
	          
	                     
	                         paging : true,
	                       stateSave: true,
	                      
	                       processing:true,
	                       
	                       info:true,
	                       
	                       pageLength: 5,
	                       filter: true,
	                       lengthChange: true,
	                       pageLength: 5,
	                       searchable: true,
	                       searching: true,
	                       filter: true,
	                       lengthChange: true,
	                       dom: 'Blfrtip', 
	  				  ajax: {
	  				      url: '/dataTable',
	  				      type: 'post',
	  				      data: function (d) {
	  		              return JSON.stringify( d )}
	  				      
	  				},
	  			
	  				  
	  				  columns: [
	  					
	  				        {
	  				        "title": "#",
	  				        render: function (data, type, row, meta) {
	  				        return meta.row + meta.settings._iDisplayStart + 1;
	  				        
	  				        }
	  				        },
	  				       
	  					
	  				    /*   { data: "salesId" }, */
	  				      { data: "prefix" },
	  				      { data: "total" },
	  				     
	  				     
	  				  ],  
	                 lengthMenu: [[5, 25, 50, 100, 250, 500, 1000, -1], [5, 25, 50, 100, 250, 500, 1000, "All"]], 
	  			
	  						
	  				});
				}
		    
				}
		
	  $('#display').click(function(){
         /*  tabling.destroy(); */
                $("#example").DataTable().destroy() 
         	tabling.init();
         	  	
          })  
          
    $(document).ready(function(){
       
    	 
      
                          });


	
	 
            $('#label').hide();
            $('#submitBtn').hide();
            $('#total').hide();
            /* var count = new Array() ; */
		
		
		  var grandPrice;
		  var indexing = 0;
		   var variantId;
		 
		   
		   var index = 0;
		 
		   var qty = 1;
		 
		   var max = 1000000;
		   var sum = new Array();
		   
		   var checking = false;
    	$('#searchBar').on("keypress",function (e){
        	var BarCode = $(this).val();
        	
        	//Counting qty
        	
    
          	 
     
        	 $('#submitBtn').show();
        	 $('#label').show();
             $('#total').show();
        	 
    	    if(e.which == 13){	
    	    	 
    	    	$.ajax('/fetchVariants/'+BarCode,{    	    		
					type:'POST',
				    dataType:'json',				
				    success: function (response){
				      
 	 	            	if(index <= Infinity){ 
    		           variantId = response.productVariantId;
 	 	            		 variantPrice = response.price;
 	 	            		 rnd = response.price;
 	 	                 if(CheckPriorValue( variantId,variantPrice,index))
 	 	 	                 {    
 	 	                	
 	 	 	                 } 

 	 	                 else  {
		                            appendingRows(response);
		                       
	                    }
					    } 
					}
			   })
		   }  


   		   function appendingRows(response){

   			response.productVariantId=response.productVariantId;
   	   		   
   			   var trHTML = '';
	            trHTML += ' <tr id="tr'+index+'"><td id="variantId'+response.productVariantId+'" style="display:none;">'+
	            
	            '<input type="text" id="check" name="salesItem['+index+'].productvariants.productVariantId" value="'+response.productVariantId+'" ></td>'+

		            '<td>'+response.products.productName+'</td>'+

			            '<td id="QtyData'+[response.productVariantId]+'"><div><span><button type="button" class="btn "  id="delQty'+[response.productVariantId]+'" onclick="delData('+response.productVariantId+','+variantPrice+')" style="display:inline; background-color: red;margin-top: -4px;" >-</button>'+

				            '&nbsp;<input type="text" class="form-control" oninput="changeQuantity('+response.productVariantId+','+variantPrice+')"  style="width:20%; display:inline;     border-color: black;border-radius: 0px; margin-top: -4px;" value="'+qty+'"'+

				              'id="Qty'+[response.productVariantId]+'"  name="salesItem['+index+'].quantity"  required>&nbsp;<button type="button" class="btn"  onclick="AddData('+response.productVariantId+','+variantPrice+')" id="addQty'+[response.productVariantId]+'" style="display:inline; background-color: springgreen; margin-top: -4px;" >+</button></span></div></td>'+

				   	            '<td id="OrgPrice'+[response.productVariantId]+'">	<div class="form-group"><input type="text" class="form-control" style="width:30%; display:inline;     border-color: black;border-radius: 0px;     margin-top: 1px; margin-rigth:20px;" placeholder="Price:" oninput="changePrice('+response.productVariantId+','+variantPrice+')" id="prices'+[response.productVariantId]+'" name="salesItem['+index+'].price " value="'+response.price+'"  required> </div></td>'+
				   	            '<td style="display:none;" id="priceData'+[response.productVariantId]+'" class="tdClass'+index+'">	<div class="form-group"><input type="text" class="form-control txtCal" style="width:30%; display:inline; margin-top:-90px; margin-rigth:20px;"    value="'+response.price+'"  required> </div> </td></tr>';
	               

            
		                            $('#records_table').append(trHTML);
		                            
		                            Totaling();
		             
	                                index++;

   	   		   }    

		    //Incerasing qty;
    	    function CheckPriorValue(variantId,variantPrice,index){
        	

    	    	 var check = $('#variantId'+variantId).find("input[type='text']").val()
        	    	           
                                  
                              if(check == variantId){

                            	   var t= ++document.getElementById("Qty"+variantId).value  ; 
                            	    var qtys=$('#QtyData'+variantId).find("input[type='text']").val();
                          	   	     var totalingPrice = variantPrice * qtys;
                          	   	$('#priceData'+variantId).find("input[type='text']").val(totalingPrice)
                          	  
                          	    grandPrice = $('#priceData'+variantId).find("input[type='text']").val();
                          /* 	  getTotal(grandPrice); */
                          Totaling();
                                   checking = true;
                                   return checking;
                                  }

    	    	                
    	    	
        	    	 }
    	
    	          

    		});



   	 //Add Button Handling
   	     function AddData(id,variantPrice){
 	  	
   	   	    var quantity= ++document.getElementById("Qty"+id).value ;
             
   	   	    var qtys=$('#QtyData'+id).find("input[type='text']").val();
   	   	     var totalingPrice = variantPrice * qtys;
   	   	$('#priceData'+id).find("input[type='text']").val(totalingPrice)
   	   
   	  Totaling();
   	    grandPrice = $('#priceData'+variantId).find("input[type='text']").val();}
   
   	 function delData(id,variantPrice){
   			
  
   	   	    var quantity= --document.getElementById("Qty"+id).value ;
             
   	   	     var qtys=$('#QtyData'+id).find("input[type='text']").val();
   	   	     var totalingPrice = variantPrice * qtys;
   	      	$('#priceData'+id).find("input[type='text']").val(totalingPrice)
          Totaling();
   	       grandPrice = $('#priceData'+variantId).find("input[type='text']").val();
    	
   		 }

	 function changePrice(id,variantPrice){
		

         var changedValue = $('#OrgPrice'+id).find("input[type='text']").val();
       
         var qtys=$('#QtyData'+id).find("input[type='text']").val();
	   	     var totalingPrice =  changedValue * qtys;
	  
     	$('#priceData'+id).find("input[type='text']").val(totalingPrice);
     	 Totaling();
     	 grandPrice = $('#priceData'+variantId).find("input[type='text']").val();
   
     	 $('#addQty'+id).attr("onclick","AddData('"+id+"', '"+changedValue+"')");
     	 $('#delQty'+id).attr("onclick","delData('"+id+"', '"+changedValue+"')");
    	 $('#QtyData'+id).attr("onchange","changeQuantity('"+id+"', '"+changedValue+"')");

		 }
	 
   function changeQuantity(id,variantPrice){

	

	   
       var qtys=$('#QtyData'+id).find("input[type='text']").val();


       var totalingPrice =  variantPrice * qtys;
	   	
	$('#priceData'+id).find("input[type='text']").val(totalingPrice);
	 Totaling();      

	   }

	 
	function Totaling(){	
		sumVal=0;       
    $('#myTable > tbody  > tr').each(function(index, tr) { 

        sumVal=sumVal + parseInt($('.tdClass'+index).find("input[type='text']").val())
  	   
  	   console.log(sumVal);

    	   $('#total').val(sumVal);
  	 });
	}      
              
             
	
        $("#form1").on("keypress", function (event) {  
            var keyPressed = event.keyCode || event.which; 
            if (keyPressed === 13) { 
                event.preventDefault(); 
                return true; 
            } 
      
        }); 
             
    $('#form1').on('submit',function(e){
    	     
  	  Swal.fire({
        icon: 'success',
        text: 'Data has been added!',

       })
     return true;
       });      

</script>
</body>
</html>