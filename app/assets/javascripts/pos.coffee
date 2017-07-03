# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '.filter', ->
    start_time = $('#start-time').val()
    end_time = $('#end-time').val()
    url = $(this).attr('data-url')
    $('#pos_table').load(url+'?company='+filter_company+'&name='+filter_expat)
