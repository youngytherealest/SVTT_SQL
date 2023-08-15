let bangdssv = $("#dashboard_bangdssv").DataTable({
    paging: true,
    lengthChange: false,
    searching: true,
    ordering: true,
    info: true,
    autoWidth: false,
    responsive: true,
    ajax: {
      type: "GET",
      url: "get_ds_sinh_vien_by_username",
      dataSrc: "",
    },
    columns: [
      { data: "mssv" },
      { data: "hoten" },
      { data: "gioitinh" },
      { data: "nganh" },
      { data: "truong" },
      {
        data: "trangthai",
        render: function(data, type, row){
          if(data==1){
            return '<span class="badge badge-warning"><i class="fa-solid fa-circle-exclamation"></i> Chưa đánh giá</span>';
          }else{
            return '<span class="badge badge-success"><i class="fa-solid fa-check"></i> Đã đánh giá</span>';
          }
        }
      },
      {
        data: "id",
        render: function (data, type, row) {
          return (
            '<a class="btn btn-info btn-sm" id="editBtn" data-id="' +
            data +
            '"><i class="fas fa-pencil-alt"></i></a>'
          );
        },
      },
    ],
  });

  function empty_modal(){
    $("#modal_title").empty();
    $("#modal_body").empty();
    $("#modal_footer").empty();
  }

  $("#dashboard_bangdssv").on('click', '#editBtn', function(){
    let id = $(this).data('id');

    empty_modal();
    $.ajax({
        url: 'get_chi_tiet_danh_gia_sv_by_id?id='+id,
        type: 'GET',
        success: function(res){
            console.log(res);
        }
    })
  });