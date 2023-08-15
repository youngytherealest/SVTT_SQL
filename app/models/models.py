from ..config import create_connection
import datetime

conn = create_connection()
cursor = conn.cursor()

def insert_sinh_vien(MSSV: str, HoTen: str, GioiTinh: int, SDT: str, Email: str, DiaChi: str, MaLop: str, Truong: str, Nganh: str, Khoa: int) -> bool:
    try:
        cursor.execute("EXEC InsertSinhVien ?, ?, ?, ?, ?, ?, ?, ?, ?, ?", MSSV, HoTen, GioiTinh, SDT, Email, DiaChi, MaLop, Truong, Nganh, Khoa)
        conn.commit()
        return True
    except Exception as e:
        print(e)
        return False
    
def verify_user(username: str, password: str):
    try:
        cursor.execute("LoginUser ?, ?", username, password)
        result = cursor.fetchone()

        if not result or not result.IsValidUser:
            return False
        return True
    except Exception as e:
        return e

def get_all_sinh_vien():
    try:
        result = cursor.execute("EXEC GetDSSVDashboard").fetchall()
        return result
    except Exception as e:
        return e
    
def count_all_sinh_vien():
    try:
        result = cursor.execute("SELECT COUNT(*) FROM SinhVien")
        return result.fetchone()[0]
    except Exception as e:
        return e
    
def ti_le_sinh_vien_da_danh_gia():
    try:
        daDanhGia = cursor.execute("EXEC GetSoLuongSinhVienDaDanhGia").fetchone()[0]
        tong = cursor.execute("SELECT COUNT(ID) FROM SinhVien").fetchone()[0]
        return str(daDanhGia) + '/' + str(tong)
    except Exception as e:
        return e

def so_luong_sinh_vien_dat_ket_qua():
    try:
        result = cursor.execute("EXEC GetSoLuongSinhVienDatKetQua").fetchone()
        return {'dat': result[0], 'khong_dat': result[1]}
    except Exception as e:
        return e

def get_so_luong_sinh_vien_theo_truong():
    try:
        result = cursor.execute("EXEC GetSoLuongSinhVienTheoTruong")
        return [{'truong': i.Ten, 'soluong': i.SLSV} for i in result.fetchall()]
    except Exception as e:
        return e

def get_so_luong_sinh_vien_theo_nganh():
    try:
        result = cursor.execute("EXEC GetSoLuongSinhVienTheoNganh")
        return [{'nganh': i.NGANH, 'soluong': i.SL} for i in result.fetchall()]
    except Exception as e:
        return e

def get_trang_thai_sinh_vien_by_id(id: str):
    try:
        i = cursor.execute("EXEC GetTrangThaiSinhVienByID ?", id).fetchone()
        return {'id': i[0], 'trangthai': i[6]}
    except Exception as e:
        return e

def get_user_info_by_username(username: str):
    try:
        result = cursor.execute("EXEC GetUserInfo ?", username)
        return result.fetchone()
    except Exception as e:
        return e
    
def get_all_de_tai_thuc_tap():
    try:
        result = cursor.execute("SELECT * FROM DeTai WHERE isDeleted != 2")
        return [{'id': i[0], 'ten': i[1], 'mota': i[2], 'xoa': i[3]} for i in result.fetchall()]
    except Exception as e:
        return e

def get_chi_tiet_de_tai_by_id(id: str):
    try:
        result = cursor.execute("EXEC GetChiTietDeTaiByID ?", id).fetchone()
        return {'id': result[0], 'ten': result[1], 'mota': result[2], 'xoa': result[3]}
    except Exception as e:
        return e
    
def update_chi_tiet_de_tai_by_id(id: str, ten: str, mota: str, isDeleted: int):
    try:
        result = cursor.execute("EXEC UpdateChiTietDeTaiByID ?, ?, ?, ?", id, ten, mota, isDeleted)
        conn.commit()
        return True
    except Exception as e:
        return e
    
def update_xoa_de_tai_by_id(id: str):
    try:
        result = cursor.execute("EXEC UpdateXoaDeTaiByID ?, ?", id, 2)
        conn.commit()
        return True
    except Exception as e:
        return e
    
def get_nhom_thuc_tap_by_user_id(id: str):
    try:
        result = cursor.execute("EXEC GetNhomThucTapByUserID ?", id)
        data = [{'ngay': datetime.datetime.strptime(i[1], "%Y-%m-%d").strftime("%d/%m/%Y"), 'ten': i[3], 'mota': i[4]} for i in result]
        return data
    except Exception as e:
        return e

def them_de_tai_thuc_tap(ten: str, mota: str, isDeleted: int):
    try:
        result = cursor.execute("EXEC InsertDeTai ?, ?, ?", ten, mota, isDeleted)
        conn.commit()
        return True
    except Exception as e:
        return e
    
def get_all_ky_thuc_tap():
    try:
        result = cursor.execute("EXEC GetDSDeTaiTheoThoiHan")
        data = [{'id': i[0], 'ngaybatdau': i[1], 'ngayketthuc': i[2], 'xoa': i[3], 'thoihan': i[4]} for i in result]
        return data
    except Exception as e:
        return e
    
def get_chi_tiet_ky_thuc_tap_by_id(id: str):
    try:
        result = cursor.execute("EXEC GetChiTietKyThucTapByID ?", id).fetchone()
        return {'id': result[0], 'ngaybatdau': result[1], 'ngayketthuc': result[2], 'xoa': result[3]}
    except Exception as e:
        return e
    
def update_chi_tiet_ky_thuc_tap_by_id(id: str, ngaybatdau: str, ngayketthuc: str, isDeleted: int):
    try:
        result = cursor.execute("EXEC UpdateChiTietKyThucTapByID ?, ?, ?, ?", id, ngaybatdau, ngayketthuc, isDeleted)
        conn.commit()
        return True
    except Exception as e:
        return e
    
def them_ky_thuc_tap(ngaybatdau: str, ngayketthuc: str, isDeleted: int):
    try:
        result = cursor.execute("EXEC InsertKyThucTap ?, ?, ?", ngaybatdau, ngayketthuc, isDeleted)
        conn.commit()
        return True
    except Exception as e:
        return e
    
def update_xoa_ky_thuc_tap_by_id(id: str):
    try:
        result = cursor.execute("EXEC UpdateXoaKyThucTapByID ?, ?", id, 2)
        conn.commit()
        return True
    except Exception as e:
        return e
    
def get_ds_nhom_thuc_tap():
    try:
        result = cursor.execute("EXEC GetDSNhomThucTap")
        data = [{'id': i[0], 'nguoihuongdan': i[2], 'ngaybatdau': i[3], 'tendetai': i[5], 'xoa': i[1]} for i in result]
        return data
    except Exception as e:
        return e
    
def get_chi_tiet_nhom_thuc_tap_by_id(id: str):
    try:
        i = cursor.execute("EXEC GetChiTietNhomThucTapByID ?", id).fetchone()
        return {'id': i[0], 'nguoihuongdan_hoten': i[5], 'nguoihuongdan_id': i[1], 'kythuctap_id': i[2], 'kythuctap_ngaybatdau': i[6], 'kythuctap_ngayketthuc': i[7], 'detai_id': i[3], 'detai_ten': i[7], 'detai_mota': i[8]}
    except Exception as e:
        return e
    
def get_chi_tiet_chinh_sua_nhom():
    try:
        ktt_obj = cursor.execute("SELECT ID, NgayBatDau FROM KyThucTap WHERE isDeleted != 2").fetchall()
        nhd_obj = cursor.execute("SELECT ID, HoTen FROM NguoiHuongDan").fetchall()
        detai_obj = cursor.execute("SELECT ID, Ten FROM DeTai WHERE isDeleted != 2").fetchall()

        ktt = [{'id': i[0], 'ngay': i[1]} for i in ktt_obj]
        nhd = [{'id': i[0], 'hoten': i[1]} for i in nhd_obj]
        detai = [{'id': i[0], 'ten': i[1]} for i in detai_obj]
        
        return {'kythuctap': ktt, 'nguoihuongdan': nhd, 'detai': detai}
    except Exception as e:
        return e
    
def update_chi_tiet_nhom_thuc_tap_by_id(id: str, kytt: str, nguoihd: str, detai: str, isDeleted: int):
    try:
        result = cursor.execute("EXEC UpdateChiTietNhomThucTapByID ?, ?, ?, ?, ?", id, kytt, nguoihd, detai, isDeleted)
        conn.commit()
        return True
    except Exception as e:
        return e
    
def update_xoa_nhom_thuc_tap_by_id(id: str):
    try:
        result = cursor.execute("EXEC UpdateXoaNhomThucTapByID ?, ?", id, 2)
        conn.commit()
        return True
    except Exception as e:
        return e
    
def them_nhom_thuc_tap(nguoihd: str, kytt: str, detai: str, isDeleted: int):
    try:
        result = cursor.execute("EXEC InsertNhomThucTap ?, ?, ?, ?", nguoihd, kytt, detai, isDeleted)
        conn.commit()
        return True
    except Exception as e:
        return e

def get_chi_tiet_sinh_vien_by_id(id: str):
    try:
        i = cursor.execute("EXEC GetThongTinChiTietSVByID ?", id).fetchone()
        return {'id': i[0], 'mssv': i[1], 'hoten': i[2], 'gioitinh': 'nam' if i[3]==1 else 'nữ', 'sdt': f'0{i[4]}', 'email': i[5], 'diachi': i[6], 'malop': i[7], 'khoa': i[8], 'nganh': i[9], 'truong': i[10], 'tendetai': i[12], 'ngaybatdau': i[13], 'nguoihuongdan': i[14]}
    except Exception as e:
        return e
    
def get_chi_tiet_sinh_vien_chua_co_nhom(id: str):
    try:
        i = cursor.execute("EXEC GetThongTinChiTietSVChuaCoNhomByID ?", id).fetchone()
        return {'id': i[0], 'mssv': i[1], 'hoten': i[2], 'gioitinh': 'Nam' if i[3]==1 else 'Nữ', 'sdt': f'0{i[4]}', 'email': i[5], 'diachi': i[6], 'malop': i[7], 'khoa': i[8], 'nganh': i[9], 'truong': i[10]}
    except Exception as e:
        return e
    
def get_chi_tiet_sinh_vien_da_co_nhom(id: str):
    try:
        i = cursor.execute("EXEC GetThongTinChiTietSVDaCoNhomByID ?", id).fetchone()
        return {'id': i[0], 'mssv': i[1], 'hoten': i[2], 'gioitinh': 'Nam' if i[3]==1 else 'Nữ', 'sdt': f'0{i[4]}', 'email': i[5], 'diachi': i[6], 'malop': i[7], 'khoa': i[8], 'nganh': i[9], 'truong': i[10], 'nguoihuongdan': i[11], 'ngaybatdau': i[12], 'tendetai': i[13]}
    except Exception as e:
        return e
    
def get_chi_tiet_sinh_vien_da_danh_gia(id: str):
    try:
        i = cursor.execute("EXEC GetThongTinChiTietSVDaDanhGiaByID ?", id).fetchone()
        return {'id': i[0], 'mssv': i[1], 'hoten': i[2], 'gioitinh': 'Nam' if i[3]==1 else 'Nữ', 'sdt': f'0{i[4]}', 'email': i[5], 'diachi': i[6], 'malop': i[7], 'khoa': i[8], 'nganh': i[9], 'truong': i[10], 'nguoihuongdan': i[11], 'ngaybatdau': i[12], 'tendetai': i[13], 'ythuckyluat_number': i[17], 'ythuckyluat_text': i[18], 'tuanthuthoigian_number': i[19], 'tuanthuthoigian_text': i[20], 'kienthuc_number': i[21], 'kienthuc_text': i[22], 'kynangnghe_number': i[23], 'kynangnghe_text': i[24], 'khanangdoclap_number': i[25], 'khanangdoclap_text': i[26], 'khanangnhom_number': i[27], 'khanangnhom_text': i[28], 'khananggiaiquyetcongviec_number': i[29], 'khananggiaiquyetcongviec_text': i[30], 'danhgiachung_number': i[31]}
    except Exception as e:
        return e