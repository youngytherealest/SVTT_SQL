var Toast = Swal.mixin({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 3000,
  });

$.ajax({
  type: 'GET',
  url: 'get_ds_nhom_thuc_tap',
  success: function(res){
    html = '';

    $.each(res, function(idx, val){
      html += '<option value="'+val.id+'">'+val.tendetai+'</option>';
    });

    $("#danhsachnhom").append(html);
  }
});

$("#danhsachnhom").on('change', function(){
  $.ajax({
    type: 'GET',
    url: 'get_chi_tiet_nhom_thuc_tap_by_id?id='+$("#danhsachnhom").val(),
    success: function(res){
      $("#nguoihuongdan").val(res.nguoihuongdan_hoten);
      $("#mota").val(res.detai_mota);
    }
  });
});