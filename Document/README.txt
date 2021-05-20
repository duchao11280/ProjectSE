1. Cài đặt jdk 11  
2. Cài đặt IDE Intellij  
3. Tải Môi trường chạy java (https://drive.google.com/drive/folders/18A-rEPJCFqmIYbM0CQLPS15UL5dnRNUR?usp=sharing)
3. Giải nén Apache tomcat  
4. Giải nén Apache maven
5. This pc->properties->advance system setting->environment variables->system variables
6. New->variable name: JAVA_HOME->variable value: C:\Program Files\AdoptOpenJDK\jdk-11.0.11.9-hotspot (tùy đường dẫn từng máy)
7. New->variable name: MAVEN_HOME->variable value: D:\Environment\apache-maven-3.6.3 (tùy đường dẫn từng máy)
8. Cài đặt XAMPP
9. Tải Navicat  (https://www.navicat.com/en/download/navicat-premium)
10. Bật XAMPP, start mục mySQL
11. Mở Navicat->File->New connection->mySQL->đặt tên localhost->nhấn ok
12. localhost -> new database -> database name: projectse ->character set : utf8->collation: utf8_unicode_ci
13. Mở projectse->right-click->execute SQL file->chọn chọn file SQL (file SQL nằm trong folder CheDoDinhDuong tên projectse.sql)->start
14. Mở project bằng intellij->Edit configuration (ở góc trên bên phải giữa giữa) -> mục Application Server->configure->chọn đường dẫn đến thư mục tomcat (D:\Environment\apache-tomcat-9.0.40 tùy theo máy để ở đâu)
15. Góc trên bên phải mục Maven->Reload (hình 2 mũi tên xoay xoay)
16. Run (Shift + F10)
 