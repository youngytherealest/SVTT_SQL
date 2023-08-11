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