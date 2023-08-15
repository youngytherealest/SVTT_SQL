from fastapi import FastAPI, Request, Depends, HTTPException, Cookie
from fastapi.security import OAuth2PasswordBearer
from fastapi.responses import HTMLResponse, JSONResponse, RedirectResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
from pydantic import BaseModel
from typing import Optional
from hashlib import sha3_256
import jwt
import datetime

from .controllers.controller import *
import os

app = FastAPI()

app.mount("/dist", StaticFiles(directory=os.path.join(os.getcwd(),"app","templates","dist")), name="dist")
app.mount("/plugins", StaticFiles(directory=os.path.join(os.getcwd(),"app","templates","plugins")), name="plugins")

templates = Jinja2Templates(directory=os.path.join(os.getcwd(),"app","templates"))


class UserCredentials(BaseModel):
    username: str
    password: str

class Token(BaseModel):
    access_token: str
    token_type: str

SECRET_KEY = "BN3298"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 60*24
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

def verify_user_route(credentials: UserCredentials):
    return verify_user_controller(username=credentials.username, password=sha3_256(bytes(credentials.password, 'utf-8')).hexdigest())

def get_current_user(token: str = Depends(oauth2_scheme)):
    credentials_exception = HTTPException(status_code=401, detail="Could not validate credentials")
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
        if username is None:
            raise credentials_exception
    except jwt.PyJWTError:
        raise credentials_exception
    return username

@app.post("/token", response_model=Token)
async def login_for_access_token(credentials: UserCredentials):
    if verify_user_route(credentials):
        access_token_expires = datetime.timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
        access_token = create_access_token(data={"sub": credentials.username}, expires_delta=access_token_expires)
        response = JSONResponse({"access_token": access_token, "token_type": "bearer"})
        response.set_cookie("token", access_token, httponly=False)
        return response
    raise HTTPException(status_code=400, detail="Incorrect username or password")

def create_access_token(data: dict, expires_delta: datetime.timedelta):
    to_encode = data.copy()
    expire = datetime.datetime.utcnow() + expires_delta
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt

@app.get("/logout")
async def logout(token: str = Cookie(None)):
    response = RedirectResponse('/login')
    response.delete_cookie("token")
    return response

@app.get('/')
async def home(request: Request, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                tong_sinh_vien: int = count_all_sinh_vien_controller()
                ti_le_da_danh_gia: float = ti_le_sinh_vien_da_danh_gia_controller()
                so_luong_ket_qua: int = so_luong_sinh_vien_dat_ket_qua_controller()
                return templates.TemplateResponse('index.html', context={'request': request, 'dashboard_tongsinhvien': tong_sinh_vien, 'dashboard_tiledadanhgia': ti_le_da_danh_gia, 'dashboard_soluongdat': so_luong_ket_qua['dat'], 'dashboard_soluongkhongdat': so_luong_ket_qua['khong_dat']})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/login')
async def login(request: Request):
    return templates.TemplateResponse('login.html', context={'request': request})

@app.get('/hosonguoihuongdan')
async def hosonguoihuongdan(request: Request, id: str, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = get_user_info_by_username(username)
                detai = get_nhom_thuc_tap_by_user_id_controller(username)
                profile = {'hoten': result[0], 'sdt': result[1], 'email': result[2], 'chucdanh': result[3], 'phong': result[4], 'zalo': result[5], 'facebook': result[6], 'github': result[7], 'avatar': result[8]}
                return templates.TemplateResponse('profile.html', context={'request': request, 'profile': profile, 'detai': detai})
                
        except jwt.PyJWTError:
            pass
        return RedirectResponse('/login')
    else:
        result = get_user_info_by_username(id)
        detai = get_nhom_thuc_tap_by_user_id_controller(id)
        profile = {'hoten': result[0], 'sdt': result[1], 'email': result[2], 'chucdanh': result[3], 'phong': result[4], 'zalo': result[5], 'facebook': result[6], 'github': result[7], 'avatar': result[8]}
        return templates.TemplateResponse('profile.html', context={'request': request, 'profile': profile, 'detai': detai})

@app.get('/danhgiasinhvien')
async def danhgiasinhvien(request: Request, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return templates.TemplateResponse('student_review.html', context={'request': request})
                
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/danhsachdetai')
async def danhsachdetai(request: Request, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return templates.TemplateResponse('projects.html', context={'request': request})
                
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/danhsachkythuctap')
async def danhsachkythuctap(request: Request, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return templates.TemplateResponse('internships.html', context={'request': request})
                
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/danhsachnhomthuctap')
async def danhsachnhomthuctap(request: Request, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return templates.TemplateResponse('groups.html', context={'request': request})
                
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_so_luong_sinh_vien_theo_truong')
async def get_so_luong_sinh_vien_theo_truong_route(token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return get_so_luong_sinh_vien_theo_truong_controller()
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_so_luong_sinh_vien_theo_nganh')
async def get_so_luong_sinh_vien_theo_nganh_route(token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return get_so_luong_sinh_vien_theo_nganh_controller()
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_all_sinh_vien')
async def get_all_sinh_vien_route(token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = get_all_sinh_vien_controller()
                ds: list = [{'id': i[0], 'mssv': i[1], 'hoten': i[2], 'gioitinh': 'Nam' if i[3]==1 else 'Nữ', 'nganh': i[4], 'truong': i[5], 'trangthai': i[6]} for i in result]
                return JSONResponse(status_code=200, content=ds)
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_user_info_by_username')
async def get_user_info_by_username_route(token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = get_user_info_by_username_controller(username)
                if result:
                    return JSONResponse(status_code=200, content={'hoten': result[0], 'sdt': result[1], 'email': result[2], 'chucdanh': result[3], 'phong': result[4], 'zalo': result[5], 'facebook': result[6], 'github': result[7], 'avatar': result[8]})
                else:
                    return JSONResponse(status_code=400, content={'status': 'User not found'})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_all_de_tai')
async def get_all_de_tai(token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return JSONResponse(status_code=200, content=get_all_de_tai_thuc_tap_controller())
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_chi_tiet_de_tai_by_id')
async def get_chi_tiet_de_tai_by_id_route(id: str, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return JSONResponse(status_code=200, content=get_chi_tiet_de_tai_by_id_controller(id))
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.post('/update_chi_tiet_de_tai_by_id')
async def update_chi_tiet_de_tai_by_id_route(id: str, ten: str, mota: str, isDeleted: int, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = update_chi_tiet_de_tai_by_id_controller(id, ten, mota, isDeleted)
                return JSONResponse(status_code=200, content={'status': 'OK'})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.post('/update_xoa_de_tai_by_id')
async def update_xoa_de_tai_by_id_route(id: str, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = update_xoa_de_tai_by_id_controller(id)
                return JSONResponse(status_code=200, content={'status': 'OK'})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.post('/them_de_tai_thuc_tap')
async def them_de_tai_thuc_tap_route(ten: str, mota: str, isDeleted: int, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = them_de_tai_thuc_tap_controller(ten, mota, isDeleted)
                return JSONResponse(status_code=200, content={'status': 'OK'})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_all_ky_thuc_tap')
async def get_all_ky_thuc_tap_route(token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return JSONResponse(status_code=200, content=get_all_ky_thuc_tap_controller())
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_chi_tiet_ky_thuc_tap_by_id')
async def get_chi_tiet_ky_thuc_tap_by_id_route(id: str, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return JSONResponse(status_code=200, content=get_chi_tiet_ky_thuc_tap_by_id_controller(id))
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.post('/update_chi_tiet_ky_thuc_tap_by_id')
async def update_chi_tiet_ky_thuc_tap_by_id_route(id: str, ngaybatdau: str, ngayketthuc: str, isDeleted: int, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = update_chi_tiet_ky_thuc_tap_by_id_controller(id, ngaybatdau, ngayketthuc, isDeleted)
                return JSONResponse(status_code=200, content={'status': 'OK'})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.post('/them_ky_thuc_tap')
async def them_ky_thuc_tap_route(ngaybatdau: str, ngayketthuc: str, isDeleted: int, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = them_ky_thuc_tap_controller(ngaybatdau, ngayketthuc, isDeleted)
                return JSONResponse(status_code=200, content={'status': 'OK'})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.post('/update_xoa_ky_thuc_tap_by_id')
async def update_xoa_ky_thuc_tap_by_id_route(id: str, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = update_xoa_ky_thuc_tap_by_id_controller(id)
                return JSONResponse(status_code=200, content={'status': 'OK'})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_ds_nhom_thuc_tap')
async def get_ds_nhom_thuc_tap_route(token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return get_ds_nhom_thuc_tap_controller()
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_chi_tiet_nhom_thuc_tap_by_id')
async def get_chi_tiet_nhom_thuc_tap_by_id_route(id: str, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return get_chi_tiet_nhom_thuc_tap_by_id_controller(id)
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_chi_tiet_chinh_sua_nhom')
async def get_chi_tiet_chinh_sua_nhom_route(token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return get_chi_tiet_chinh_sua_nhom_controller()
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.post('/update_chi_tiet_nhom_thuc_tap_by_id')
async def update_chi_tiet_nhom_thuc_tap_by_id_route(id: str, kytt: str, nguoihd: str, detai: str, isDeleted: int, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = update_chi_tiet_nhom_thuc_tap_by_id_controller(id, kytt, nguoihd, detai, isDeleted)
                return JSONResponse(status_code=200, content={'status': 'OK'})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.post('/update_xoa_nhom_thuc_tap_by_id')
async def update_xoa_nhom_thuc_tap_by_id_route(id: str, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = update_xoa_nhom_thuc_tap_by_id_controller(id)
                return JSONResponse(status_code=200, content={'status': 'OK'})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.post('/them_nhom_thuc_tap')
async def them_nhom_thuc_tap_route(nguoihd: str, kytt: str, detai: str, isDeleted: int, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                result = them_nhom_thuc_tap_controller(nguoihd, kytt, detai, isDeleted)
                return JSONResponse(status_code=200, content={'status': 'OK'})
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_chi_tiet_sinh_vien_by_id')
async def get_chi_tiet_sinh_vien_by_id_route(id: str, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
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
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_ds_sinh_vien_by_username')
async def get_ds_sinh_vien_by_username_route(token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return JSONResponse(status_code=200, content=get_ds_sinh_vien_by_username_controller(username))
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')

@app.get('/get_chi_tiet_danh_gia_sv_by_id')
async def get_chi_tiet_danh_gia_sv_by_id_route(id: str, token: str = Cookie(None)):
    if token:
        try:
            payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
            username = payload.get("sub")
            if username:
                return get_chi_tiet_danh_gia_sv_by_id_controller(id=id)
        except jwt.PyJWTError:
            pass
    return RedirectResponse('/login')