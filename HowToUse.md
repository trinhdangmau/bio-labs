Cách sử dụng phần mềm

_**Yêu cầu:**_

**Java Runtime Environment 7.0** hoặc mới hơn (nếu máy chưa có, các bạn có thể down về theo link sau: http://www.oracle.com/technetwork/java/javase/downloads/java-se-jre-7-download-432155.html)

**R**: Windown: http://cran.r-project.org/bin/windows/base/

Mac Os: http://cran.r-project.org/bin/macosx/

Linux(ubuntu): sudo apt-get install r-base



_**Sử dụng:**_

**Quản lý cơ sở dữ liệu:** run BioLabs.jar sử dụng usename: test; pass:123

Download hướng dẫn sử dụng chi tiết


**Phân tích số liệu**: Khởi động R\run command source [đường dẫn tới file Biolabs.R trong thư mục R-project](link.md)

run start.biolabs() để cài đặt các package yêu cầu or install.packages(c("RSQLite","vegan","untb"))

-> sử dụng các function được viết trong biolabs.r để phân tích số liệu.... cụ thể vui lòng check BioLabsFunctions