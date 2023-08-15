from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse, JSONResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from .controllers.controller import *
import os

app = FastAPI()

app.mount("/dist", StaticFiles(directory=os.path.join(os.getcwd(),"app","templates","dist")), name="dist")
app.mount("/plugins", StaticFiles(directory=os.path.join(os.getcwd(),"app","templates","plugins")), name="plugins")

templates = Jinja2Templates(directory=os.path.join(os.getcwd(),"app","templates"))

@app.get('/')
async def home(request: Request):
    tong_sinh_vien: int = count_all_sinh_vien_controller()
    ti_le_da_danh_gia: float = ti_le_sinh_vien_da_danh_gia_controller()
    so_luong_ket_qua: int = so_luong_sinh_vien_dat_ket_qua_controller()
    return templates.TemplateResponse('index.html', context={'request': request, 'dashboard_tongsinhvien': tong_sinh_vien, 'dashboard_tiledadanhgia': ti_le_da_danh_gia, 'dashboard_soluongdat': so_luong_ket_qua['dat'], 'dashboard_soluongkhongdat': so_luong_ket_qua['khong_dat']})

@app.get('/hosonguoihuongdan')
async def hosonguoihuongdan(request: Request, id: str):
    result = get_user_info_by_username(id)
    detai = get_nhom_thuc_tap_by_user_id_controller(id)
    profile = {'hoten': result[0], 'sdt': result[1], 'email': result[2], 'chucdanh': result[3], 'phong': result[4], 'zalo': result[5], 'facebook': result[6], 'github': result[7], 'avatar': result[8]}
    return templates.TemplateResponse('profile.html', context={'request': request, 'profile': profile, 'detai': detai})

@app.get('/danhsachdetai')
async def danhsachdetai(request: Request):
    return templates.TemplateResponse('projects.html', context={'request': request})

@app.get('/danhsachkythuctap')
async def danhsachkythuctap(request: Request):
    return templates.TemplateResponse('internships.html', context={'request': request})

@app.get('/danhsachnhomthuctap')
async def danhsachnhomthuctap(request: Request):
    return templates.TemplateResponse('groups.html', context={'request': request})

@app.get('/get_so_luong_sinh_vien_theo_truong')
async def get_so_luong_sinh_vien_theo_truong_route():
    return get_so_luong_sinh_vien_theo_truong_controller()

@app.get('/get_so_luong_sinh_vien_theo_nganh')
async def get_so_luong_sinh_vien_theo_nganh_route():
    return get_so_luong_sinh_vien_theo_nganh_controller()

@app.get('/get_all_sinh_vien')
async def get_all_sinh_vien_route():
    result = get_all_sinh_vien_controller()
    ds: list = [{'id': i[0], 'mssv': i[1], 'hoten': i[2], 'gioitinh': 'Nam' if i[3]==1 else 'Nữ', 'nganh': i[4], 'truong': i[5], 'trangthai': i[6]} for i in result]
    return JSONResponse(status_code=200, content=ds)

@app.get('/get_user_info_by_username')
async def get_user_info_by_username_route(username: str):
    result = get_user_info_by_username_controller(username)
    if result:
        return JSONResponse(status_code=200, content={'hoten': result[0], 'sdt': result[1], 'email': result[2], 'chucdanh': result[3], 'phong': result[4], 'zalo': result[5], 'facebook': result[6], 'github': result[7], 'avatar': result[8]})
    else:
        return JSONResponse(status_code=400)

@app.get('/get_all_de_tai')
async def get_all_de_tai():
    return JSONResponse(status_code=200, content=get_all_de_tai_thuc_tap_controller())

@app.get('/get_chi_tiet_de_tai_by_id')
async def get_chi_tiet_de_tai_by_id_route(id: str):
    return JSONResponse(status_code=200, content=get_chi_tiet_de_tai_by_id_controller(id))

@app.post('/update_chi_tiet_de_tai_by_id')
async def update_chi_tiet_de_tai_by_id_route(id: str, ten: str, mota: str, isDeleted: int):
    result = update_chi_tiet_de_tai_by_id_controller(id, ten, mota, isDeleted)
    return JSONResponse(status_code=200, content={'status': 'OK'})

@app.post('/update_xoa_de_tai_by_id')
async def update_xoa_de_tai_by_id_route(id: str):
    result = update_xoa_de_tai_by_id_controller(id)
    return JSONResponse(status_code=200, content={'status': 'OK'})

@app.post('/them_de_tai_thuc_tap')
async def them_de_tai_thuc_tap_route(ten: str, mota: str, isDeleted: int):
    result = them_de_tai_thuc_tap_controller(ten, mota, isDeleted)
    return JSONResponse(status_code=200, content={'status': 'OK'})

@app.get('/get_all_ky_thuc_tap')
async def get_all_ky_thuc_tap_route():
    return JSONResponse(status_code=200, content=get_all_ky_thuc_tap_controller())

@app.get('/get_chi_tiet_ky_thuc_tap_by_id')
async def get_chi_tiet_ky_thuc_tap_by_id_route(id: str):
    return JSONResponse(status_code=200, content=get_chi_tiet_ky_thuc_tap_by_id_controller(id))

@app.post('/update_chi_tiet_ky_thuc_tap_by_id')
async def update_chi_tiet_ky_thuc_tap_by_id_route(id: str, ngaybatdau: str, ngayketthuc: str, isDeleted: int):
    result = update_chi_tiet_ky_thuc_tap_by_id_controller(id, ngaybatdau, ngayketthuc, isDeleted)
    return JSONResponse(status_code=200, content={'status': 'OK'})

@app.post('/them_ky_thuc_tap')
async def them_ky_thuc_tap_route(ngaybatdau: str, ngayketthuc: str, isDeleted: int):
    result = them_ky_thuc_tap_controller(ngaybatdau, ngayketthuc, isDeleted)
    return JSONResponse(status_code=200, content={'status': 'OK'})

@app.post('/update_xoa_ky_thuc_tap_by_id')
async def update_xoa_ky_thuc_tap_by_id_route(id: str):
    result = update_xoa_ky_thuc_tap_by_id_controller(id)
    return JSONResponse(status_code=200, content={'status': 'OK'})

@app.get('/get_ds_nhom_thuc_tap')
async def get_ds_nhom_thuc_tap_route():
    return get_ds_nhom_thuc_tap_controller()

@app.get('/get_chi_tiet_nhom_thuc_tap_by_id')
async def get_chi_tiet_nhom_thuc_tap_by_id_route(id: str):
    return get_chi_tiet_nhom_thuc_tap_by_id_controller(id)

@app.get('/get_chi_tiet_chinh_sua_nhom')
async def get_chi_tiet_chinh_sua_nhom_route():
    return get_chi_tiet_chinh_sua_nhom_controller()

@app.post('/update_chi_tiet_nhom_thuc_tap_by_id')
async def update_chi_tiet_nhom_thuc_tap_by_id_route(id: str, kytt: str, nguoihd: str, detai: str, isDeleted: int):
    result = update_chi_tiet_nhom_thuc_tap_by_id_controller(id, kytt, nguoihd, detai, isDeleted)
    return JSONResponse(status_code=200, content={'status': 'OK'})

@app.post('/update_xoa_nhom_thuc_tap_by_id')
async def update_xoa_nhom_thuc_tap_by_id_route(id: str):
    result = update_xoa_nhom_thuc_tap_by_id_controller(id)
    return JSONResponse(status_code=200, content={'status': 'OK'})

@app.post('/them_nhom_thuc_tap')
async def them_nhom_thuc_tap_route(nguoihd: str, kytt: str, detai: str, isDeleted: int):
    result = them_nhom_thuc_tap_controller(nguoihd, kytt, detai, isDeleted)
    return JSONResponse(status_code=200, content={'status': 'OK'})

@app.get('/get_chi_tiet_sinh_vien_by_id')
async def get_chi_tiet_sinh_vien_by_id_route(id: str):
    condition = get_trang_thai_sinh_vien_by_id_controller(id)
    result: dict = {}
    if condition['trangthai']==0:
        result = get_chi_tiet_sinh_vien_chua_co_nhom_controller(id)
    elif condition['trangthai'] == 1:
        result = get_chi_tiet_sinh_vien_da_co_nhom_controller(id)
    else:
        result = get_chi_tiet_sinh_vien_da_danh_gia_controller(id)
    result['trangthai'] = condition['trangthai']
    return JSONResponse(status_code=200, content=result)