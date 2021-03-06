<img src="web.png">
 
## [วิดีโอการใช้งานเบื้องต้น](http://www.youtube.com/watch?v=7Cte73w959E)
 

## Changelog ###
16/05/2563
* เปิดระบบจัดการแอพผ่านหน้าเว็บ โดยต้องกดติดตั้งธีมเริ่มต้นก่อนถึงจะใช้งานได้

15/05/2563
* เพิ่มกล่องข้อมูล สินค้า/ตำแหน่งงาน ทั้งหน้าลิสและหน้าเนื้อหา

13/05/2563
* ปุ่ม/รูปภาพ สามารถกำหนดการคลิก เพื่อเปิดเว็บไซต์ หรือแสดงหมวดบทความภายในแอพได้

12/05/2563
* Bottom Narbar สามารถใช้งานได้

11/05/2563
* ตั้ง Appbar/Navbar ลอยบนเนื้อหาได้
* เริ่มแสดง heading/paragraph/list/image ของเนื้อหาบทความ

01/05/2563
* เริ่มพัฒนา
 

<img src="screenshot.gif">

# แอพมือถือสำเร็จรูป (Flutter)
แอพพลิเคชั่นมือถือแบบสำเร็จรูป ที่พัฒนาด้วย Flutter เพื่อให้รองรับสำหรับการใช้บน Android และ iOS 

โดยแอพนี้จะทำงานร่วมกับระบบเว็บไซต์ไซต์สำเร็จรูป https://ifelse.co เพื่อจัดการเนื้อหาและดีไซน์สำหรับการแสดงผลในแอพ
 

# เริ่มต้นออกแบบแอพจากหน้าเว็บ
1. สร้างเว็บไซต์ที่ ifelse.co
2. เลือกเมนู "แอพ" จากหน้าต่างเครื่องมือสำหรับผู้ดูแล
3. คลิกที่ปุ่ม ติดตั้งธีมเริ่มต้น (เฉพาะครั้งแรก)
4. เลือกแก้ไขแต่ละหน้าหน้าแอพ ได้จากลิสรายการ
 

# การทดสอบแอพ
- ตอนนี้ยังต้อง build เองเท่านั้น โดยแก้ IFELSE_TOKEN ที่ไฟล์ lib/main.dart เป็นค่าที่ได้จากหน้าเว็บจัดการ
- หากลบค่า IFELSE_TOKEN ที่ไฟล์ lib/main.dart ออก ตัวแอพจะขึ้นหน้าให้กรอก token ทุกครั้งที่มีการเปิดแอพ

<img src="demo-page.png">
 


## การจัดการภายในแอพ
แอพจะดึงข้อมูลจากระบบภายในเว็บไซต์ที่เราสร้างไว้ ( หากยังไม่มีสามารถสมัครได้ฟรีที่ [https://ifelse.co](https://ifelse.co) ) เช่น
- ดีไซน์ส่วนต่างๆของแอพ เช่น ข้อความและสีในตำแหน่งต่างๆ, ไอคอนและรูปภาพ, รูปแบบการแสดงผลในแต่ละส่วน
- เนื้อหาต่างๆในเว็บ ตามที่เรากำหนดไว้ว่าจะแสดงอะไรบ้าง
 


## ลิขสิทธิ์
source code ชุดนี้ เปิดให้ใช้ฟรี และสามารถนำไปดัดแปลงเพิ่มเติมเองได้ตามความต้องการ.


## เกี่ยวกับเรา
[บริษัท อิฟ เอลซ์ จำกัด](https://ifelse.co.th) ผู้พัฒนาและให้บริการ[เว็บไซต์สำเร็จรูป](https://ifelse.co) และ[แอพพลิเคชั่นมือถือสำเร็จรูป](https://ifelse.co) #

