// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//


//= require jquery3
//= require select2
//= require raty
//= require bootstrap-sprockets
//= require semantic-ui
//= require rails-ujs
//= require_tree .

const initializeRaty = () => {
  if ($("#raty")) {
    $("#raty").raty({
      path: '/assets/',
      scoreName: "product_review[rating]"
    })
  }
}

const initializeProductSelect2 = () => {
  if ($("#productSelector").length > 0) {
    $("#productSelector").select2({
      placeholder: "Select a product",
      theme: "bootstrap"
    })

    const productId = $("#productSelect").data("initially-selected-product-id")
    if (productId) {
      $("#productSelector").val(productId).trigger('change');
    }
  }
}

const initializeProductCategorySelect2 = () => {
  if ($("#tagSelector").length != 0) {
    $( "#tagSelector" ).select2({
        placeholder: "Select a category",
        theme: "bootstrap"

    });

    $("#tagSelector").on("select2:select", (e) => {
      const option = e.params.data
      fetch(`/api/categories/${option.id}/sub_categories.json`, {
      	method: 'get'
      }).then(function(response) {
        response.json().then((subCategories) => {
          const optionsHTML = subCategories.map((sc) => `<option value=${sc.id}>${sc.name}</option>`)
          const generatedHtml = [`<select id='subCategorySelector' name='subcategory_id'>`, optionsHTML.join(""), '</select>'].join("")

          $("#subCategorySelect").html(generatedHtml).promise().done(function(){
            $('#subCategorySelector').select2({})
          });

        })
      }).catch(function(err) {
      	// Error :(
      });
    })
  }
}

$(document).ready(() => {
  initializeProductCategorySelect2()
  initializeProductSelect2()
  initializeRaty()
})
