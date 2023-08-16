from ..models.models import *

def insert_sinh_vien_controller(MSSV, HoTen: str, GioiTinh: int, SDT: str, Email: str, DiaChi: str, MaLop: str, Truong: str, Nganh: str, Khoa: int) -> bool:
    result = insert_sinh_vien(MSSV, HoTen, GioiTinh, SDT, Email, DiaChi, MaLop, Truong, Nganh, Khoa)
    return result

def get_all_sinh_vien_controller():
    return get_all_sinh_vien()

def count_all_sinh_vien_controller():
    return count_all_sinh_vien()

def get_so_luong_sinh_vien_theo_truong_controller():
    return get_so_luong_sinh_vien_theo_truong()

def get_so_luong_sinh_vien_theo_nganh_controller():
    return get_so_luong_sinh_vien_theo_nganh()

def get_user_info_by_username_controller(username: str):
    return get_user_info_by_username(username)

def ti_le_sinh_vien_da_danh_gia_controller():
    return ti_le_sinh_vien_da_danh_gia()

def so_luong_sinh_vien_dat_ket_qua_controller():
    return so_luong_sinh_vien_dat_ket_qua()

def get_all_de_tai_thuc_tap_controller():
    return get_all_de_tai_thuc_tap()

def get_chi_tiet_de_tai_by_id_controller(id: str):
    return get_chi_tiet_de_tai_by_id(id)

def update_chi_tiet_de_tai_by_id_controller(id: str, ten: str, mota: str, isDeleted: int):
    return update_chi_tiet_de_tai_by_id(id, ten, mota, isDeleted)

def update_xoa_de_tai_by_id_controller(id: str):
    return update_xoa_de_tai_by_id(id)

def get_nhom_thuc_tap_by_user_id_controller(id: str):
    return get_nhom_thuc_tap_by_user_id(id)

def them_de_tai_thuc_tap_controller(ten: str, mota: str, isDeleted: int):
    return them_de_tai_thuc_tap(ten, mota, isDeleted)

def get_all_ky_thuc_tap_controller():
    return get_all_ky_thuc_tap()

def get_chi_tiet_ky_thuc_tap_by_id_controller(id: str):
    return get_chi_tiet_ky_thuc_tap_by_id(id)

def update_chi_tiet_ky_thuc_tap_by_id_controller(id: str, ngaybatdau: str, ngayketthuc: str, isDeleted: int):
    return update_chi_tiet_ky_thuc_tap_by_id(id, ngaybatdau, ngayketthuc, isDeleted)

def them_ky_thuc_tap_controller(ngaybatdau: str, ngayketthuc: str, isDeleted: int):
    return them_ky_thuc_tap(ngaybatdau, ngayketthuc, isDeleted)

def update_xoa_ky_thuc_tap_by_id_controller(id: str):
    return update_xoa_ky_thuc_tap_by_id(id)

def get_ds_nhom_thuc_tap_controller():
    return get_ds_nhom_thuc_tap()

def get_chi_tiet_nhom_thuc_tap_by_id_controller(id: str):
    return get_chi_tiet_nhom_thuc_tap_by_id(id)

def get_chi_tiet_chinh_sua_nhom_controller():
    return get_chi_tiet_chinh_sua_nhom()

def update_chi_tiet_nhom_thuc_tap_by_id_controller(id: str, kytt: str, nguoihd: str, detai: str, isDeleted: int):
    return update_chi_tiet_nhom_thuc_tap_by_id(id, kytt, nguoihd, detai, isDeleted)

def update_xoa_nhom_thuc_tap_by_id_controller(id: str):
    return update_xoa_nhom_thuc_tap_by_id(id)

def them_nhom_thuc_tap_controller(nguoihd: str, kytt: str, detai: str, isDeleted: int):
    return them_nhom_thuc_tap(nguoihd, kytt, detai, isDeleted)

def get_chi_tiet_sinh_vien_by_id_controller(id: str):
    return get_chi_tiet_sinh_vien_by_id(id)

def get_trang_thai_sinh_vien_by_id_controller(id: str):
    return get_trang_thai_sinh_vien_by_id(id)

def get_chi_tiet_sinh_vien_chua_co_nhom_controller(id: str):
    return get_chi_tiet_sinh_vien_chua_co_nhom(id)

def get_chi_tiet_sinh_vien_da_co_nhom_controller(id: str):
    return get_chi_tiet_sinh_vien_da_co_nhom(id)

def get_chi_tiet_sinh_vien_da_danh_gia_controller(id: str):
    return get_chi_tiet_sinh_vien_da_danh_gia(id)

def verify_user_controller(username: str, password: str):
    return verify_user(username, password)

def get_ds_sinh_vien_by_username_controller(username: str):
    return get_ds_sinh_vien_by_username(username)

def get_chi_tiet_danh_gia_sv_by_id_controller(id: str):
    return get_chi_tiet_danh_gia_sv_by_id(id)

def update_danh_gia_sv_by_id_controller(sinhvienid: str, nhomid: int, ythuckyluat_number: float, ythuckyluat_text: str, tuanthuthoigian_number: float, tuanthuthoigian_text: str, kienthuc_number: float, kienthuc_text: str, kynangnghe_number: float, kynangnghe_text: str, khanangdoclap_number: float, khanangdoclap_text: str, khanangnhom_number: float, khanangnhom_text: str, khananggiaiquyetcongviec_number: float, khananggiaiquyetcongviec_text: str, danhgiachung_number: float):
    return update_danh_gia_sv_by_id(sinhvienid, nhomid, ythuckyluat_number, ythuckyluat_text, tuanthuthoigian_number, tuanthuthoigian_text, kienthuc_number, kienthuc_text, kynangnghe_number, kynangnghe_text, khanangdoclap_number, khanangdoclap_text, khanangnhom_number, khanangnhom_text, khananggiaiquyetcongviec_number, khananggiaiquyetcongviec_text, danhgiachung_number)

def get_id_nhom_by_sv_id_controller(id: str):
    return get_id_nhom_by_sv_id(id)