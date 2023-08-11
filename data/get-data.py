import pymongo
from typing import Union, Any
from datetime import datetime
import json

client = pymongo.MongoClient('mongodb+srv://giangphan028:ThanhGiang2808@cluster0.vzpfca2.mongodb.net/')
database = client['SinhVienThucTap']

danhgia = database['DanhGia']
detai = database['DeTai']
kythuctap = database['KyThucTap']
nganhhoc = database['NganhHoc']
nguoihuongdan = database['NguoiHuongDan']
nhomhuongdan = database['NhomHuongDan']
sinhvien = database['SinhVien']
truong = database['Truong']
xaphuong = database['XaPhuong']
lienhe = database['LienHe']
log = database['LogHoatDong']
conf = database['CauHinh']

result = nhomhuongdan.aggregate([
    {
        ''
    }
])

data: list = []

for i in result:
    data.append({
        'Ten': i['name'],
        'MoTa': i['descriptions'],
        'isDeleted':  (1 if i['isDeleted'] is True else 0)
    })

with open(f"detai.json", encoding="utf8", mode="w") as f:
    f.write(json.dumps(data, indent=4, ensure_ascii=False))