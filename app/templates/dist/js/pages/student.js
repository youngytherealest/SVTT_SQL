var Toast = Swal.mixin({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 3000,
  });

$("#sinhvien_diachi").autocomplete({
    source: function(req, res){
        let url = '/goi_y_dia_chi?q='+req.term;

        $.ajax({
            type: 'GET',
            url: url,
            dataType: 'json',
            success: function(data){
                res(data)
            }
        })
    },
    minLength: 1
});

$.ajax({
    type: 'GET',
    url: 'get_danh_sach_nganh',
    success: function(res){
        let html = '';
        $.each(res, function(idx, val){
            html += '<option value="'+val+'">'+val+'</option>';
        });
        $("#sinhvien_nganh").append(html);
    }
});

$.ajax({
    type: 'GET',
    url: 'get_danh_sach_truong',
    success: function(res){
        let html = '';
        $.each(res, function(idx, val){
            html += '<option value="'+val.kyhieu+'">'+val.ten+'</option>';
        });
        $("#sinhvien_truong").append(html);
    }
});


if (document.cookie.indexOf('submited') == -1){
    $('#submitBtn').on('click', function(){
        $('input[type="text"], input[type="email"], input[type="number"]').each(function(){
            if($(this).val() === ''){
                Toast.fire({
                    icon: "error",
                    title: "Vui lòng điền đầy đủ thông tin",
                });
            }
        });
    
        let data = {
            'mssv': $('#sinhvien_mssv').val(),
            'hoten': $('#sinhvien_hoten').val(),
            'gioitinh': $('#sinhvien_gioitinh').val(),
            'sdt': $('#sinhvien_sdt').val(),
            'email': $('#sinhvien_email').val(),
            'diachi': $('#sinhvien_diachi').val(),
            'malop': $('#sinhvien_malop').val(),
            'khoa': $('#sinhvien_khoa').val(),
            'nganh': $('#sinhvien_nganh').val(),
            'truong': $('#sinhvien_truong').val(),
        }
        $.ajax({
            type: 'POST',
            url: '/thong_tin_sinh_vien',
            data: JSON.stringify(data),
            headers: {
                "accept": "application/json",
                "Content-Type": "application/json"
                },
            success: function(res){
                Toast.fire({
                    icon: "success",
                    title: "Đã lưu thông tin thành công",
                });
                disable_input();
            },
            error: function(){
                Toast.fire({
                    icon: "error",
                    title: "Đã xảy ra lỗi, vui lòng thử lại sau",
                });
            }
        });
    });
}else{
    disable_input();
    $("#message").text("Bạn đã điền thông tin");
}

function disable_input(){
    $('input, select').attr('disabled', 'disabled');
    $('#submitBtn').prop('disabled', true);
}