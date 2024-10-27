Use langchain_user;
drop table Subjects;
select * from user;
delete from user where mssv='12331232';
select * from session;
insert into user(mssv) values ('2111111359');
update user
set password = '$2a$10$Avz0wILFi8F/8lVcyCMBVemtK65vxiiv3fVmpi2ERIWQLkawXLk/K'
where mssv = '2111111359';
update user
set roles = 'admin'
where mssv = '2111111661';
ALTER TABLE user
ADD roles varchar(255);
select * from Subjects;
select * from Chapter;
delete from Chapter where Id='CHƯƠNG_1';
CREATE TABLE Subjects(
					IdSubject nvarchar(50),
					TitleSubject text,
                    SubjectContent longtext,
                    constraint pk_IDS primary key (IdSubject ASC)
                    );
CREATE TABLE Chapter(
					Id nvarchar(50),
                    Title text,
                    IdSubject nvarchar(50),
                    ParentId nvarchar(50),
                    constraint pk_ChID primary key (Id ASC),
                    constraint fk1 foreign key (ParentId) references Chapter(Id),
                    constraint fk2 foreign key (IdSubject) references Subjects(IdSubject)
                    );

insert into Subjects values ('CTGT01','CẤU TRÚC DỮ LIỆU VÀ GIẢI THUẬT','  <div class="tab-pane active" id="CHƯƠNG_1">
                            <h1 class="heading1">
                                CHƯƠNG 1.<br/>
                                TỔNG QUAN
                            </h1>
                            <div class="tab-pane" id="1.1" >
                                    <h1 class="heading2" >1. 1. VAI TRÒ CỦA THUẬT TOÁN VÀ CẤU TRÚC DỮ LIỆU</h1>
                                <p class="des">
                                    Để giải một bài toán trong thực tế bằng chương trình máy tính ta
                                    phải bắt đầu từ việc xác định bài toán. Cần nhiều thời gian và công
                                    sức để xác định chính xác bài toán cần giải quyết, tức là phải trả lời rõ
                                    ràng câu hỏi phải làm gì và như thế nào, vì thông thường hầu hết các
                                    bài toán là chưa rõ ràng và có cảm giác phức tạp khi bắt đầu xem xét,
                                    tìm hiểu. Để giảm bớt sự phức tạp của các bài toán thực tế, cũng như
                                    làm rõ hơn các yêu cầu cần giải quyết, phải hình thức hóa hoặc mô
                                    hình hóa bài toán, nghĩa là phát biểu lại bài toán thực tế thành một bài
                                    toán hình thức. Khi một bài toán đã được hình thức hoá, ta có thể tìm
                                    kiếm cách giải và xác định có hay không một lời giải có sẵn để giải
                                    bài toán ấy. Trong trường hợp chưa có lời giải cho bài toán, vẫn có thể
                                    dựa vào cách thức ta đã mô hình hóa và các thông tin có liên quan đến
                                    bài toán để xây dựng một cách thức giải cho bài toán. Như thế, thông
                                    qua thao tác mô hình hóa, sẽ dễ hơn trong việc tìm lời giải cho bài
                                    toán ấy – đó chính là giải thuật.
                                </p>
                                <p class="des">
                                    Có thể thấy rằng, lời giải là tập hợp các bước hữu hạn nối tiếp
                                    nhau để thực hiện các yêu cầu nào đó mà tập hợp của các kết quả
                                    thông qua từng bước thực hiện giúp ta giải được bài toán. Có thể thấy
                                    rằng các xử lý chi tiết trong từng bước phản ánh các thao tác trên các
                                    đối tượng mang thông tin trong bài toán, đó chính là dữ liệu, bao gồm
                                    các dữ liệu có sẵn, các dữ liệu nhập vào thêm cho bài toán và các dữ
                                    liệu trung gian được tạo ra trong quá trình xử lý. Cách thức dữ liệu lưu
                                    trữ và biểu diễn các thông tin cần thiết cho bài toán tạo thành các cấu
                                    trúc lưu trữ thông tin – cấu trúc dữ liệu.
        
                                <p class="des">
                                    Như thế khi nói đến lời giải hay nói cách khác là giải thuật thì
                                    không thể không nói đến dữ liệu và cách thức xử lý trên dữ liệu ấy.
                                    Hơn thế nữa giữa cách thức lưu trữ dữ liệu và giải thuật có mối quan
                                    hệ mật thiết với nhau khi giải quyết một bài toán trong tin học.
                                </p>
                                <p class="des">
                                    Điều này cũng được Niklaus Wirth - một nhà khoa học uy tín
                                    trong lĩnh vực công nghệ thông tin, khẳng định qua một công thức nổi
                                    tiếng: Chương trình (Program) = Cấu trúc dữ liệu (Data Structure) +
                                    Giải thuật (Algorithm). Điều này nói lên bản chất của việc tìm lời giải
                                    cho một bài toán trong tin học là đi tìm một cấu trúc dữ liệu phù hợp
                                    để biểu diễn dữ liệu của bài toán và từ đó x y dựng giải thuật phù hợp
                                    với cấu trúc dữ liệu đã chọn. Ngày nay, với sự phát triển của các k 
                                    thuật lập trình, công thức của Wirth không hẳn còn đúng tuyệt đối
                                    nữa, nhưng nó vẫn phản ánh sự gắn kết và thể hiện tầm quan trọng của
                                    các cấu trúc dữ liệu và giải thuật.
                                </p>
                                </div>
                                <div class="tab-pane" id="1.2">
                                    <h2 class="heading2" >
                                        1.2. THUẬT TOÁN
                                    </h2>
                                    <h3 class="heading3">
                                        1.2.1. Định nghĩa thuật toán
                                    </h3>
                                    <p class="des">
                                        Có rất nhiều định nghĩa cũng như cách phát biểu khác nhau về
                                        định nghĩa của thuật toán. Theo Thomas H . Cormen trong cuốn sách
                                        nổi tiếng viết về thuật toán "Introduction to Algorithm", thuật toán
                                        được định nghĩa là một thủ tục tính toán xác định; nhận vào các giá
                                        tri  hoặc một tập các giá trị  gọi là giá trị đầu vào và tinh ra các giá
                                        tri  hoặc một tập giá trị mới được gọi là giá trị đầu ra. Nói một cách
                                        khác, thuật toán giống như là quy trình để hoàn thành một công việc
                                        cụ thể xác định nào đó.
                                        
                                    </p>
                                    <h3 class="heading3">
                                        1.2.2. Đặc trưng của thuật toán
                                    </h3>
                                    <p class="des">
                                        Thuật toán có các đặc trưng như sau :
                                    </p>
                                    <p class="des">
                                        - <i>Tính đúng đắn:</i> thuật toán cần phải đảm bảo cho một kết quả
                                        đúng  sau khi thực hiện đối với các bộ dữ liệu đầu vào. Đây có thể nói
                                        là đặc trưng quan trọng nhất đối với một thuật toán.
                                    </p>
                                    <p class="des">
                                        - <i>Tính dừng:</i> thuật toán cần phải đảm bảo  sẽ dừng sau một  số hữu
                                        hạn bước.
                                    </p>
                                    <p class="des">
                                        - <i>Tính xác định:</i> các bước của thuật toán phải được phát biểu rõ
                                        ràng, cụ thể, tránh gây nhầm lẫn.
                                    </p>
                                    <p class="des">
                                        - <i>Tính hiệu quả:</i>  thuật toán được xem là hiêụ quả nếu có khả năng
                                        giải quyết hiệu qủa bài toán đặt ra, đáp ứng yêu cầu về mặt thời gian
                                        xử lý hoặc không gian lưu trữ trong bộ nhớ.
                                    </p>
                                    <p class="des">
                                        - <i>Tính phổ quát:</i> thuật toán được gọi là có tính phố quát (phổ
                                        biến) nếu có thể giải quyết được một lớp các bài toán tương tự.
                                    </p>
            
                                    <h3 class="heading3">
                                        1.2.3. Biểu diễn thuật toán
                                    </h3>
                                    <p class="des">
                                        Có nhiều cách khác nhau để biểu diễn thuật toán, gồm: biểu diễn
                                        bằng ngôn ngữ tự nhiên, lưu đồ giải và mã giả.
                                    </p>
            
                                    <h3 class="heading3">
                                        Biểu diễn bằng ngôn ngữ tự nhiên
                                    </h3>
                                    <p class="des">Ví dụ:</p>
                                    <p class="des">
                                        Thuật toán tính tổng tất cả các số nguyên dương nhỏ hơn N bằng ngôn ngữ tự nhiên, gồm các bước sau:
                                    </p>
                                    <pre>
                    - Bước 1: Khởi gán giá trị biến S = 0; Khởi gán giá trị biến i = 1;
                    - Bước 2: Nếu i< N thì
                    S = S + i;
                    Ngược lại:
                    Chuyển qua bước 4;
                    - Bước 3: Gán i = i + 1;
                    Quay lại bước 2;
                    - Bước 4: Tổng cần tìm là S. 
                        </pre>
                                    <p class="des">Nhận xét:</p>
                                    <p class="des">
                                        Với cách biểu diễn này, có ưu điểm là đơn giản, dễ hiểu. Tuy
                                        nhiên, nhược điểm là hơi dài dòng, đôi lúc khó hiểu, không diễn đạt
                                        được rõ ràng một cách trực quan nhất từng bước của thuật toán và mối
                                        quan hệ giữa chúng.
                                    </p>
                                    <h3 class="heading3">
                                        Biểu diễn bằng lưu đồ giải thuật
                                    </h3>
                                    <p class="des">
                                        Trong cách biểu diễn này sử dụng, hệ thống các ký hiệu để mô tả
                                        chức năng, ý nghĩa của từng bước thực hiện trong thuật toán.
                                    </p>
                                    <p class="des">
                                        Hệ thống các ký hiệu và chức n ng của các ký hiệu sử dụng để
                                        biểu diễn thuật toán :
                                    </p>
                                    <img src="/hinh1.jpg" alt="" srcset="">
                                    <p class="des">Ví dụ:</p>
                                    <p class="des">
                                        Thuật toán tìm phần tử giá trị lớn nhất trong mảng một chiều a
                                        gồm n phần tử được biểu diễn bằng lưu đồ như sau: 
                                    </p>
                                    <img src="/hinh2.jpg" alt="" class="">
                                    <p class="des"><i>Nhận Xét:</i></p>
                                    <p class="des">
                                        Với cách biểu diễn này, có ưu điểm là tăng tính trực quan, rõ
                                        ràng trong các bước thực hiện thuật toán, trong đó có đi sâu vào
                                        từng chi tiết xử lý cụ thể trong từng bước của thuật toán. Tuy
                                        nhiên, hạn chế của cách biểu diễn này là cần nhiều thời gian hơn
                                        trong việc xây dựng các bước thực hiện so với biểu diễn bằng ngôn
                                        ngữ tự nhiên.
                                    </p>
                                    <h3 class="heading3">
                                        Biểu diễn bằng mã giả
                                    </h3>
                                    <p class="des">
                                        Cách biểu diễn này kết hợp giữa sử dụng ngôn ngữ tự nhiên và
                                        một ngôn ngữ lập trình nào đó trong biểu diễn các bước thuật toán.
                                    </p>
                                    <p class="des"><i>Ví dụ:</i></p>
                                    <p class="des">
                                        Thuật toán tìm phần tử lớn nhất trong mảng một chiều a gồm n
                                        phần tử bằng mã giả được thể hiện như sau:  
                                    </p>
            
                                    <pre>
                    - Bước 1: Khởi gán giá trị biến a_max=a_ 0 ;
                    - Bước 2: Khởi gán giá trị biến i=1;
                    - Bước 3: while (i< n) 
                    { 
                        if (a_max < a_i)
                            a_max = a_i ;
                        i= i +1;
                        }
                    end while;
                                    </pre>
                                    <p class="des">Nhận xét :  </p>
                                    <p class="des">
                                        Với cách biểu diễn này, có ưu điểm là đỡ cồng kềnh so với cách 
                                        biểu diễn bằng lưu đồ giải thuật, rõ ràng hơn  so với cách biểu diễn 
                                        bằng ngôn ngữ tự nhiên. Tuy nhiên, hạn chế của cách biểu diễn này là 
                                        đòi hỏi phải có kiến thức cơ bản về ngôn ngữ lập trình nào đó để sử 
                                        dụng biểu diễn các bước thuật toán1.
                                    </p>
                                    <p class="des">
                                        Thông thường hai cách biểu diễn thuật toán sử dụng ph  biến là 
                                        ngôn ngữ tự nhiên và lưu đồ giải thuật. 
                                    </p>
                                    <h3 class="heading3">
                                        1.2.4. Độ phức tạp thuật toán  
                                    </h3>
                                    <p class="des">
                                        Định nghĩa về độ phức tạp thuật toán: 
                                    </p>
                                    <p class="des">
                                        Cho hai hàm f và g có miền xác định trong tập số tự nhiên. Ta 
                                        viết f(n) = O(g(n)) và nói f(n) có cấp cao nhất là g(n) khi tồn tại hằng 
                                        số C và k sao cho |f(n)| ≤  C.g(n) với mọi n > k 
                                    </p>
                                    <p class="des">
                                        Thông thường, để đánh giá mức độ tốt, xấu và so sánh các thuật 
                                        toán cùng loại, có thể dựa trên hai tiêu chuẩn:  
                                    </p>
                                    <p class="des">
                                        - Tiêu chuẩn thuật toán đơn giản, dễ hiểu, dễ cài đặt. 
                                    </p>
                                    <p class="des">
                                        - Hoặc tiêu chu n dựa vào thời gian thực hiện và tài nguyên tử 
                                        dụng để thực hiện trên dữ liệu. 
                                    </p>
                                    <p class="des">
                                        Trên thực tế các thuật toán hiệu quả thì thường không dễ hiểu, 
                                        cách cài đặt hiệu quả cũng không dễ dàng thực hiện và hiểu được một 
                                        cách nhanh chóng và như thế đôi khi thuật toán càng hiệu quả thì càng 
                                        khó hiểu, cài đặt càng phức tạp. Tuy nhiên, điều này không phải lúc 
                                        nào cũng đúng trong mọi trường hợp. Do đó, để đánh giá và so sánh 
                                        các thuật toán, ta thường dựa trên độ phức tạp về thời gian thực hiện 
                                        của thuật toán, gọi là độ phức tạp thuật toán.  
                                    </p>
                                    <p class="des">
                                        Về bản chất độ phức tạp thuật toán là một hàm ước lượng số phép 
                                        tính mà thuật toán cần thực hiện, trên một bộ dữ liệu đầu vào kích 
                                        thước N trong bài toán. Khi xem xét  so  sánh các thuật toán cùng loại, 
                                        ta thường xét độ phức tạp của thuật toán trong các trường hợp  trung 
                                        bình, xấu nhất và tốt nhất. 
                                    </p>
                                    <p class="des">
                                        Phân tích thuật toán là một công việc rất khó khăn, đòi hỏi phải 
                                        có những hiểu biết sâu sắc về thuật toán và nhiều kiến thức toán học
                                        khác. Một công việc mà không phải bất cứ người nào cũng làm được, 
                                        vì phải hiểu được các khái niệm liên quan.  
                                    </p>
                                    
                                    <p class="des">
                                        Ðánh giá về thời gian của thuật toán không phải là xác định thời 
                                        gian tuyệt đối (chạy thuật toán mất bao nhiêu giây, bao nhiêu phút,...) 
                                        để thực hiện thuật toán mà là xác định mối liên quan giữa dữ liệu đầu 
                                        vào  (input) của thuật toán và chi phí (số thao tác, số phép tính cộng, 
                                        trừ, nhân, chia, rút căn,...) để thực hiện thuật toán. Sở dĩ người ta 
                                        không quan tâm đến thời gian tuyệt đối của thuật toán, vì yếu tố này 
                                        phụ thuộc vào tốc độ của máy tính, mà các máy tính khác nhau thì có 
                                        tốc độ rất khác nhau. Như thế, một cách tổng quát, chi phí thực hiện 
                                        thuật toán là một hàm  số phụ thuộc vào dữ liệu đầu vào:  
                                    </p>
                                    <p class="des --center">
                                        T = f(input) 
                                    </p>
                                    <p class="des">
                                        Tuy vậy, khi phân tích thuật toán, người ta thường chỉ chú ý đến 
                                        mối liên quan giữa độ lớn của dữ liệu đầu vào và chi phí. Trong các 
                                        thuật toán, độ lớn của dữ liệu đầu vào thường được thể hiện bằng 
                                        một con số nguyên n.  hẳng hạn   sắp xếp N con  số nguyên, tìm con 
                                        số lớn nhất trong N  số, tính điểm trung bình của N học  sinh, ... Lúc 
                                        này, người ta thể hiện chi phí thực hiện thuật toán bằng một hàm  số 
                                        phụ thuộc vào N:
                                    </p>
                                    <p class="des --center">
                                        T = f(N) 
                                    </p>
                                    <p class="des">
                                        Việc xây dựng một hàm T tổng quát như trên trong mọi trường 
                                        hợp của thuật toán là một việc rất khó khăn, nhiều lúc không thể thực 
                                        hiện được. Chính vì vậy mà ta chỉ xây dựng hàm T cho một số trường 
                                        hợp đáng chú ý nhất của thuật toán, thường là trường hợp tốt nhất và 
                                        xấu nhất.  
                                    </p>
                                    <p class="des">
                                        Ta xét lại ví dụ thuật toán tìm phần tử giá trị lớn nhất được nêu ở trên: 
                                    </p>
                                    <pre>
            - Bước 1: Ghi nhớ a_max = a1 
            - Bước 2:  hởi gán giá trị biến i = 2 
            - Bước 3: Nếu  (i < N) thì thực hiện : 
            
            + Bước 3.1: Nếu  ai > a_max ) thì  
                                Ghi nhớ amax = ai 
            + Bước 3.2 : Gán i = i+1 //  tăng i lên một đơn vị 
            Ngược lại :  
                    chuyển  sang bước 5. 
            - Bước 4. Trở lại bước 3. 
            - Bước 5. Phần tử lớn nhất dãy a chính là a_max.  kết thúc. 
                                    </pre>
                                    <p class="des">Nhận xét :</p>
                                    <p class="des">
                                        - Nếu mảng chỉ có 1 phần tử thì phần tử đó là  số lớn nhất.
                                    </p>
                                    <p class="des">
                                        - Giả  ử mảng có N phần tử và ta đã xác định được phần tử lớn 
                                        nhất là a_max . Nếu bổ   sung thêm phần tử thứ a_n+1 vào dãy mà a_n+1 > a_max 
                                        thì a_n+1 chính là phần tử lớn nhất của mảng có N+1 phần tử. Trường 
                                        hợp ngược lại, nghĩa là a_n+1 < a_max thì a_max vẫn là phần tử lớn nhất của 
                                        mảng có N+1 phần tử.
                                    </p>
                                    <p class="des">
                                        Trong thuật toán trên, để đơn giản, ta chỉ xem chi phí là số lần so 
                                        sánh ở bước 3.1 và số lần ghi nhớ trong bước 3.1, như thế :
                                    </p>
                                    <p class="des">
                                        - Trường hợp tốt nhất của thuật toán này xảy ra khi con số lớn 
                                            nhất nằm đầu dãy (a_max = a1) 
                                    </p>
                                    <p class="des">
                                        - Trường hợp xấu nhất xảy ra khi con số lớn nhất nằm ở cuối dãy 
                                        (a_max = a_N) và dãy được sắp xếp theo thứ tự tăng dần. 
                                    </p>
                                    <p class="des">
                                        Dựa theo  sơ đồ khối của thuật toán, ta nhận thấy rằng, trong mọi 
                                        trường hợp của bài toán, thao tác ở bước 3.1 luôn được thực hiện và số 
                                        lần thực hiện là N - 1 (ứng với việc xét từ phần tử a_2 đến a_N). Ta gọi 
                                        đây là chi phí cố định hoặc bất biến của thuật toán.
                                    </p>
                                    <p class="des">
                                        <i>Trường hợp tốt  nhất : </i>
                                    </p>
                                    <p class="des">
                                        Do a_max = a_1 , suy ra với mọi i >2, a_i< a_max. Do đó, điều kiện a_i > 
                                        a_max ở bước 3.1 luôn không thỏa mãn nên thao tác ghi nhớ không bao 
                                        giờ được thực hiện. Như vậy, chi phí chung cho trường hợp này chính 
                                        là chi phí cố định của bài toán.
            
                                    </p>
                                    <p class="des --center">
                                        T = f(N) = N-1 
                                    </p>
                                    <p class="des">
                                        <i>Trường hợ  xấu  nhất:</i>
                                    </p>
                                    <p class="des">
                                        Ta có  với mọi i>1, a_i-1< ai  do định nghĩa mảng được  ắp xếp 
                                        tăng dần) nên điều kiện a_i>a_max ở bước 3.1 luôn thỏa mãn, thao tác ghi 
                                        nhớ luôn được thực hiện. Như vậy, ngoài chi phí chung là N-1 phép so 
                                        ánh, ta cần phải dùng thêm N-1 thao tác ghi nhớ ở bước 3.1. Như 
                                        vậy, tăng chi phí của trường hợp này:  
                                    </p>
                                    <p class="des --center">
                                        T = f(N) = 2(N-1) = 2N-2 
                                    </p>
                                    <p class="des">
                                        Tuy chi phí của thuật toán trong trường hợp tốt nhất và xấu nhất 
                                        có thể nói lên nhiều điều, nhưng vẫn chưa đưa ra được một hình dung 
                                        tốt nhất về độ phức tạp của thuật toán. Ðể có thể hình dung chính xác 
                                        về độ phức tạp của thuật toán, ta xét đến một yếu tố khác là độ tăng  
                                        của chi phí khi độ lớn N của dữ liệu đầu vào tăng.
                                    </p>
                                    <p class="des">
                                        Theo định nghĩa ở trên, ta nhận thấy chi phí thấp nhất và lớn nhất 
                                        của thuật toán tìm số lớn nhất đều bị chặn bởi O(f(N)) (tồn tại hằng  số                
                                        C = 10, k = 1 để 2N - 2 < 10N với mọi N>1). 
                                    </p>
                                    <p class="des">
                                        Một cách tổng quát, nếu hàm chi phí của thuật toán (xét trong 
                                        một trường hợp nào đó) bị chặn bởi O(f(N)) thì ta nói rằng thuật toán 
                                        có độ phức tạp là O(f(N)) trong trường hợp đó. 
                                    </p>
                                    <p class="des">
                                        Như vậy, thuật toán tìm  số lớn nhất có độ phức tạp trong trường 
                                        hợp tốt nhất và xấu nhất đều là O (N). Người ta gọi các thuật toán có 
                                        độ phức tạp O(N) là các thuật toán có độ phức tạp tuyến tính. 
                                    </p>
                                    <p class="des">
                                        Bảng dưới đây thể hiện độ phức tạp của thuật toán được sử dụng 
                                        rộng rãi. Các độ phức tạp được sắp xếp theo thứ tự tăng dần.
                                    </p>
                                    <p class="des --center">
                                        <table>
                                            <head>
                                                <tr>
                                                    <th>Tên</th>
                                                    <th>Ký hiệu</th>
                                                </tr>
                                            </head>
                                            <tbody>
                                                <tr>
                                                    <td>Độ phức tạp hằng số</td>
                                                    <td>O(C)</td>
                                                </tr>
                                                <tr>
                                                    <td>Độ phức tạp logarith</td>
                                                    <td>O(logN)</td>
                                                </tr>
                                                <tr>
                                                    <td>Độ phức tạp tuyến tính</td>
                                                    <td>O(N)</td>
                                                </tr>
                                                <tr>
                                                    <td>Độ phức tạp NlogN</td>
                                                    <td>O(N*logN)</td>
                                                </tr>
                                                <tr>
                                                    <td>Độ phức tạp đa thức</td>
                                                    <td>O(Nk)</td>
                                                </tr>
                                                <tr>
                                                    <td>Độ phức tạp lũy thừa</td>
                                                    <td>O(aN)</td>
                                                </tr>
                                                <tr>
                                                    <td>Độ phức tạp giai thừa</td>
                                                    <td>O(N!)</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </p>
                                    <h3 class="heading3">
                                        1.2.5. Các chiến lược thiết kế thuật toán 
                                    </h3>
            
                                </div>
                        </div>                      
                        <div class="tab-pane" id="CHƯƠNG_2">
                            <h1 class="heading1">
                                CHƯƠNG 2
                                SẮP XẾP VÀ TÌM KIẾM
                            </h1>
                           <div id="2.1">
                            <h2 class="heading2" >2. 1. MỐI QUAN HỆ GIỮA NHU CẦU SẮP XẾP VÀ TÌM KIẾM
                                DỮ LIỆU</h2>
                            <p class="des">
                                Ngày nay, với sự bùng n của dữ liệu, các công cụ tìm kiếm trên
                                mạng ngày càng trở nên quan trọng hơn bao giờ hết. Chính nhờ các
                                công cụ tìm kiếm này mà người dùng có cơ hội tìm được nhanh chóng
                                các thông tin và dữ liệu cần thiết thông qua thao tác nhập vào các từ
                                khóa nội dung để truy xuất đến các hệ thống lưu trữ và quản lý dữ
                                liệu. Các công cụ tìm kiếm Google, Yahoo,.. là các ví dụ rất cụ thể
                                cho nhu cầu tìm kiếm thông tin, khi m i ngày có hàng tỷ thao tác tìm
                                kiếm được thực hiện trên các công cụ này.
                            </p>
                            <p class="des">
                                Khi xem xét vấn đề ở phạm vi nhỏ hơn, với các ứng dụng cá
                                nhân hàng ngày, như phần mềm soạn thảo Microsoft Word chẳng
                                hạn, thì thao tác tìm kiếm cũng được sử dụng khá nhiều trong quá
                                trình người dùng sử dụng phần mềm. Do đó có thể nói, cho dù ở
                                phạm vi nhỏ trong một ứng dụng soạn thảo hay phạm vi lớn hơn là
                                trong các công cụ tìm kiếm trên mạng thì thao tác tìm kiếm luôn
                                được sử dụng nhiều nhất. 
                            </p>
                            <p class="des">
                                Bên cạnh đó, khi nói tới thao tác tìm kiếm thì ta cũng thường
                                đề cập đến thao tác sắp xếp, bởi cả hai thao tác tìm kiếm và sắp xếp
                                đều thực hiện với dữ liệu và khi dữ liệu trở nên bùng n thì việc t
                                chức, sắp xếp lại, hệ thống lại dữ liệu đóng vai trò rất quan trọng,
                                tác động đến hiệu n ng của thao tác tìm kiếm. Để đạt được điều
                                này dữ liệu phải được t chức theo một thứ tự nào đó để hiệu quả
                                hơn, vì vậy nhu cầu sắp xếp dữ liệu cũng rất quan trọng. Như thế,
                                nhu cầu tìm kiếm và nhu cầu sắp xếp dữ liệu luôn song hành với nhau
                                và hai yếu tố này luôn có mối quan hệ tương h lẫn nhau trong các
                                hệ thống quản lý và lưu trữ dữ liệu.
                            </p>
                           </div>
                            <div id="2.2">
                                <h2 class="heading2" id="2.2">2.2. ĐỊNH NGHĨA BÀI TOÁN SẮP XẾP</h2>
                            <p class="des">
                                Sắp xếp là quá trình xử lý một danh sách các phần tử để đặt
                                chúng theo một thứ tự thỏa mãn một tiêu chu n nào đó dựa trên dữ
                                liệu được lưu trong các phần tử.
                            </p>
                            <p class="des">
                                Bài toán sắp xếp được phát biểu như sau:
                            </p>
                            <p class="des">
                                Cho trước một dãy số a1 , a2 ,… , aN gồm N phần tử được lưu trữ trong cấu trúc dữ liệu mảng. Hãy sắp xếp lại dãy số a1 , a2 ,… , aN, sao cho hình thành được dãy mới ak1 , ak2 ,… ,akN có thứ tự (ví dụ tăng dần, nghĩa là aki > aki-1).
                            </p>
                            <p class="des">Như thế, sau khi sắp xếp xong thứ tự các phần tử trong dãy sẽ
                                thay đ i vị trí sao cho thỏa mãn yêu cầu trên.</p>
                            </div>
                            <h2 class="heading2" id="2.3">2.3. CÁC GIẢI THUẬT SẮP XẾP NỘI</h2>
                            <p class="des">
                                Khi xây dựng các thuật toán sắp xếp, ta cần chú ý tìm cách giảm
                                thiểu những thao tác o ánh và đ i ch các phần tử để t ng hiệu quả
                                của thuật toán. Thao tác sắp xếp có thể tiến hành ở bộ nhớ trong của
                                máy tính trong trường hợp số lượng các phần tử không quá lớn) được
                                gọi là sắp xếp nội hoặc sắp xếp tiến hành trên các thiết bị lưu trữ ngoài
                                (ví dụ như các phần tử dữ liệu lưu trên fil ) được gọi là sắp xếp ngoại.
                            </p>
                            <p class="des">Một số giải thuật sắp xếp nội thông dụng:</p>
                            <ul class="list">
                                <li>Đổi chỗ trực tiếp</li>
                                <li>Chọn trực tiếp (Selection Sort)</li>
                                <li>Chèn trực tiếp</li>
                                <li>Đổi chỗ trực tiếp (Interchane sort)</li>
                                <li>Nổi bọt(Bubble sort)</li>
                                <li>Shaker sort</li>
                                <li>Chèn nhị phân (Binary Insertion sort)</li>
                                <li>Shell sort</li>
                                <li>Heap sort</li>
                                <li>Quick sort</li>
                                <li>Merge sort</li>
                            </ul>
                            <h3 class="heading3" id="2.3.1">2.3.1. Các giải thuật sắp xếp cơ bản</h3>
                            <h4 class="heading4" id="2.3.1.1">2.3.1.1. Giải thuật sắp xếp chọn trực tiếp</h4>
                            <p class="des-bold">Ý tưởng giải thuật</p>
                            <p class="des">
                                Giải thuật chọn trực tiếp chọn phần tử nhỏ nhất trong N phần tử
                                của dãy số đã cho ban đầu. Đưa phần tử này về vị trí đúng là đầu dãy
                                hiện hành. Sau đó, không quan t m đến nó nữa, xem dãy hiện hành
                                chỉ còn N-1 phần tử của dãy ban đầu (bắt đầu từ vị trí thứ 2), lặp lại
                                quá trình trên cho trên dãy N-1 phần tử hiện hành cho đến khi dãy chỉ
                                còn một phần tử.
                            </p>
                            <p class="des-bold">Các bước giải thuật</p>
                            <ul class="list2">
                                <li>Khởi gán giá trị biến i =1</li>
                                <li>Tìm phần tử a[min] nhỏ nhất trong dãy hiện hành từ
                                    a[i] đến a[N]</li>
                                <li>Hoán vị phần tử a[min] và a[i]</li>
                                <li>Nếu i ≤ N thì</li>
                            </ul>
                            <ul class="list3"> 
                                <li>i = i + 1</li>
                                <li>Lặp lại bước 2</li>
                                <li>Ngược lại: Kết thúc</li>
                            </ul>
                            
                            <p class="des-bold">Cài đặt giải thuật</p>
                            <pre>void SelectionSort(int a[], int N) {
        int i, j;
        int min; // chỉ số phần tử nhỏ nhất trong dãy hiện hành
        for (i = 0; i < N - 1; i++) {
        min = i;
        for (j = i + 1; j < N; j++) {
            if (a[j] < a[min])
                min = j; // vị trí phần tử hiện tại nhỏ nhất
        }
        if (min != i) {
            Swap(a[min], a[i]); // hàm hoán vị a[min], a[i]
        }
            }
        }
    
    void Swap(int& a, int& b) {
        int temp = a;
        a = b;
        b = temp;
    }
                            </pre>
                            <p class="des">Ví dụ:</p>
                            <p class="des">Giả sử cho dãy ban đầu là ={3, 9, 6, 1, 2}. Hãy sp xếp dãy số
                                đã cho có thứ tự t ng dần.</p>
                            <p class="des">Các bước giải thuật được thực hiện như sau:</p>
                            <ul>
                                <li class="square-list">Vòng lặp i=0; dãy : 3, 9, 6, 1, 2, ố phần tử của dãy 5</li>
                                <li class="list">Giả ử phần tử nhỏ nhất Min = [0] = 3</li>
                                <li class="list">Tìm được phần tử nhỏ nhất thực tế Min = [3]=1</li>
                                <li class="list">Hoán vị [0] và [3], được dãy ố mới 1, 9, 6, 3, 2</li>
                                <li class="list">Loại phần tử [0] ra khỏi dãy</li>
                                <li class="square-list">Vòng lặp i=1; dãy :1, 9, 6, 3, 2, ố phần tử của dãy 4</li>
                                <li class="list">Giả ử phần tử nhỏ nhất Min = [1] = 9</li>
                                <li class="list">Tìm được phần tử nhỏ nhất thực tế Min = A[4]=2</li>
                                <li class="list">Hoán vị [1] và [4], được dãy ố mới 1, 2, 6, 3, 9</li>
                                <li class="list">Loại phần tử A[1] ra khỏi dãy</li>
                                <li class="square-list">Vòng lặp i=2; dãy :1, 2, 6, 3, 9, ố phần tử của dãy 3</li>
                                <li class="list">Giả ử phần tử nhỏ nhất Min = [2] = 6</li>
                                <li class="list">Tìm được phần tử nhỏ nhất thực tế Min = [3]=3</li>
                                <li class="list">Hoán vị [2] và [3], được dãy ố mới 1, 2, 3, 6, 9</li>
                                <li class="list">Loại phần tử [2] ra khỏi dãy</li>
                                <li class="square-list">Vòng lặp i=3; dãy :1, 2, 3, 6, 9, ố phần tử của dãy 2</li>
                                <li class="list">Giả ử phần tử nhỏ nhất Min = [3] = 6</li>
                                <li class="list">Tìm được phần tử nhỏ nhất thực tế Min = [3]=6</li>
                                <li class="list">Không hoán vị trong trường hợp này do phần tử giả ử nhỏ
                                    nhất và phần tử nhỏ nhất thực tế c ng nằm ở một ví trí trong
                                    dãy.
                                </li>
                                <li class="list">Loại phần tử [3] ra khỏi dãy</li>
    
                                <li class="square-list">Vòng lặp i=4; dãy :1, 2, 3, 6, 9, ố phần tử của dãy 1</li>
                            </ul>
                            <p class="des">Dừng giải thuật</p>
                            <p class="des">Vậy dãy au khi ắp xếp t ng 1, 2, 3, 6, 9</p>
                            <p class="des-bold">Đánh giá giải thuật</p>
                            <p class="des">Với m i giá trị của i, giải thuật thực hiện (N – i – 1) ph p o ánh
                                và vì i chạy từ 0 cho tới (N – 2), giải thuật sẽ cần (N - 1) + (N - 2) +
                                … + 1 = N (N - 1)/2 tức là O(N2) phép so sánh.</p>
                            <p class="des">Trong mọi trường hợp ố lần o ánh của giải thuật là không đ i.
                                M i lần chạy của vòng lặp đối với biến i, có thể có nhiều nhất một lần
                                đ i ch hai phần tử nên ố lần đ i ch nhiều nhất của giải thuật là N.
                                Như vậy, trong trường hợp tốt nhất, giải thuật cần 0 lần đ i ch , trung
                                bình cần N 2 lần đ i ch và xấu nhất cần N lần đ i ch .</p>
                            <h4 class="heading4" id="2.3.1.2">2.3.1.2. Giải thuật sắp xếp đ i ch trực tiếp</h4>
                            <p class="des-bold">Ý tưởng giải thuật</p>
                            <p class="des">Xuất phát từ đầu dãy, tìm tất cả các cặp phần tử gần nhau
                                không thỏa mãn yêu cầu sắp xếp thứ tự (các cặp phần tử nghịch
                                thế , tức thế các cặp phần tử có giá trị theo thứ tự ngược lại so với
                                nhu cầu sắp xếp mong muốn) và tiến hành đ i ch vị trí cho nhau,
                                ví dụ nếu yêu cầu sắp thứ tự t ng và cặp phần tử gần nhau không
                                thỏa mãn là t ng thì tiến hành đ i ch vị trí cho nhau để thỏa điều
                                kiện là sắp thứ tự t ng, lặp lại xử lý trên với các cặp phần tử tiếp
                                theo trong dãy.</p>
                            <p class="des-bold">Các bước giải thuật</p>
                            <ul class="list2">
                                <li>Khởi gán i = 0; // bắ đầ d yệ ừ dãy</li>
                                <li>Khởi gán j = i + 1;</li>
                                <li>Trong khi j < N thì</li>
                                <p class="center">{ Nếu (a[j] < a[i]) //xé cặ hần ử a[i], a[j]</p>
                                <p class="center">Swap (a[i], a[j]); // hàm hoán vị a[i], a[j]</p>
                                <p class="center">j = j+1;}</p>
                                <li>i-i+1;</li>
                            </ul>
                            <ul class="list">
                                <li>Nếu i < N – 1 thì</li>
                                <li>Lặp lại bước 2</li>
                                <li>Ngược lại</li>
                                <li>Dừng giải thuật.</li>
                            </ul>
                            <p class="des-bold">Cài đặt giải thuật</p>
                            <pre>void InterchangeSort(int a[], int N) {
        int i, j;
        for (i = 0; i < N - 1; i++) {
            for (j = i + 1; j < N; j++) {
                if (a[j] < a[i]) {
                    Swap(a[i], a[j]); // hàm hoán vị a[i], a[j]
                }
            }
        }
    }
                            </pre>
                            <p class="des">Ví dụ:</p>
                            <p class="des">Giả ử cho dãy ban đầu là ={3, 9, 6, 1, 2}. Hãy ắp xếp dãy ố
                                đã cho có thứ tự t ng dần.</p>
                            <p class="des">Các bước giải thuật được thực hiện như Sau</p>
                            <ul>
                                <li class="square-list">Vòng lặp i=0; dãy : 3, 9, 6, 1, 2</li>
                                <li class="list">Vòng lặp j = 1 do [0] < [1] không hoán vị</li>
                                <li class="list">Vòng lặp j = 2 do [0] < [2] không hoán vị</li>
                                <li class="list">Vòng lặp j = 3 do [0] > [3] hoán vị [0] và [3]. Dãy
                                    mới {1, 9, 6, 3, 2}</li>
                                <li class="list">Vòng lặp j = 4 do [0] < [4] không hoán vị</li>
                                <li class="square-list">Vòng lặp i=1; dãy 1, 9, 6, 3, 2</li>
                                <li class="list">Vòng lặp j = 2 do [1] > A[2] :hoán vị [1] và [2]. Dãy
                                    mới {1, 6, 9, 3, 2}</li>
                                <li class="list">Vòng lặp j = 3 do A[1] > A[3] : hoán vị [1] và A[3]. Dãy
                                    mới {1, 3, 9, 6, 2}</li>
                                <li class="list">Vòng lặp j = 4 do [1] > [4] hoán vị [1] và [4]. Dãy
                                    mới {1, 2, 9, 6, 3}</li>
                                <li class="square-list">Vòng lặp i=2; dãy : 1, 2, 9, 6, 3</li>
                                <li class="list">Vòng lặp j = 3 do [2] > [3] hoán vị [2] và [3]. Dãy
                                    mới {1, 2, 6, 9, 3}</li>
                                <li class="list">Vòng lặp j = 4 do [2] > [4] hoán vị [2] và [4]. Dãy
                                    mới {1, 2, 3, 9, 6}</li>
                                <li class="square-list">Vòng lặp i=3; dãy : 1, 2, 3, 9, 6</li>
                                <li class="list">Vòng lặp j = 4 do [3] > [4] hoán vị [3] và [4]. Dãy
                                    mới {1, 2, 3, 6, 9}</li>
                            </ul>
                            <p class="des">Vậy dãy au khi ắp xếp t ng 1, 2, 3, 6, 9.</p>
                            <p class="des-bold">Đánh giá giải thuật</p>
                            <p class="des">Có thể thấy rằng, so với giải thuật sắp xếp chọn trực tiếp, giải
                                thuật ắp xếp bằng cách đ i ch trực tiếp cần ố bước o ánh tương
                                đương tức là N*(N - 1) 2 lần o ánh. Nhưng ố bước đ i ch hai
                                phần tử cũng bằng với ố lần o ánh : N*(N - 1)/2.</p>
                            <p class="des">Trong trường hợp xấu nhất ố bước đ i ch của giải thuật bằng
                                với ố lần o ánh, trong trường hợp trung bình ố bước đ i ch là N
                                *(N - 1)/4. Trong trường hợp tốt nhất, ố bước đ i ch bằng 0. Như
                                vậy, giải thuật ắp xếp đ i ch trực tiếp nói chung là chậm hơn nhiều
                                o với giải thuật ắp xếp chọn trực triếp, do ố lần đ i ch nhiều hơn.</p>
                            <h4 class="heading4" id="2.3.1.3">2.3.1.3. Giải thuật sắp xếp chèn trực tiếp</h4>
                            <p class="des-bold">Ý tường giải thuật</p>
                            <p class="des">Giả sử cho dãy số a1, a2 ,… , aN , trong đó có i phần tử đầu tiên đã
                                có thứ tự. tưởng giải thuật là tìm cách chèn ph n tử ai+1 vào vị trí
                                thích hợp của đoạn từ phần tử a1 đến ai sao cho từ a1 đến ai+1 cũng có
                                thứ tự.</p>
                            <p class="des-bold">Các bước giải thuật</p>
                            <ul class="list2">
                                <li>Khởi gán i = 1; //giả sử có đoạn a[1] đã được sắp</li>
                                <li>Gán x = a[i]; // tìm vị trí pos thích hợ rong đoạn
                                    a[1] đế a[i-1] để chèn a[i] vào</li>
                                <li>Dời ch các phần tử từ a[po ] đến a[i-1] sang phải 1 vị
                                    trí để dành ch cho a[i]</li>
                                <li>Gán a[pos] = x; //đoạn a[1]..a[i] đã được sắp</li>
                                <li>Gán i = i+1</li>
                            </ul>
                            <ul class="list">
                                <li>Nếu i < N thì</li>
                                <li>Lặp lại bước 2</li>
                                <li>Ngược lại</li>
                                <li>Dừng giải thuật.</li>
                            </ul>
                            <p class="des-bold">Cài đặt giải thuật</p>
                            <pre>void InsertionSort(int a[], int N) {
        int i, pos, x;
        for (i = 1; i < N; i++) {
            x = a[i];
            pos = i - 1;
            while ((pos >= 0) && (a[pos] > x)) {
                a[pos + 1] = a[pos];
                pos--;
            }
            a[pos + 1] = x;
        }
    }
                            </pre>
                            <p class="des">Ví dụ:</p>
                            <p class="des">Giả sử cho dãy ban đầu là ={3, 9, 6, 1, 2}. Hãy ắp xếp dãy ố
                                đã cho có thứ tự t ng dần.</p>
                            <p class="des">Các bước giải thuật được thực hiện như sau:</p>
                            <ul>
                                <li class="square-list">Vòng lặp i=1; dãy : 3, 9, 6, 1, 2</li>
                                <li class="list">Phần tử đã ắp xếp [0] = 3</li>
                                <li class="list">So ánh phần tử [1]= 9 và [0]= 3 để chèn [1] vào dãy
                                    để được dãy có 2 phần tử [0], [1] t ng dần</li>
                                <li class="list">Không thực hiện đ i ch [0], [1], do [1] > [0]</li>
                                <li class="list">Ta được 2 phần tử ắp t ng trong dãy 3, 9, 6, 1, 2</li>
    
                                <li class="square-list">Vòng lặp i=2; dãy : 3, 9, 6, 1, 2</li>
                                <li class="list">Phần tử đã ắp xếp [0], [1]</li>
                                <li class="list">So ánh phần tử [2]= 6 và { [0]= 3, [1]=9} để chèn
                                    [2] vào dãy để được dãy có 3 phần tử { [0], [1], [2]}
                                    t ng</li>
                                <li class="list">Do [2]< [1], nên dời ch qua lại [1] và [2]</li>
                                <li class="list">Ta được 3 phần tử ắp t ng trong dãy 3, 6, 9, 1, 2</li>
    
                                <li class="square-list">Vòng lặp i=3; dãy 3, 6, 9, 1,</li>
                                <li class="list">Phần tử đã ắp xếp [0], [1],</li>
                                <li class="list">So ánh phần tử [3]= 1 và {A[0]=3, A[1]=6, A[2]=9} để
                                    chèn A[3] vào dãy để được dãy có 4 phần tử { [0], [1],
                                    A[2], A[3]} t ng dần</li>
                                <li class="list">Do [3] nhỏ hơn đồng thời [0], [1], [2], nên dời ch
                                    A[0], A[1], [2] qua một vị trí, [3] thế ch [0] au dời
                                    ch .</li>
                                <li class="list">Ta được 4 phần tử ắp t ng trong dãy 1, 3, 6, 9, 2</li>
    
                                <li class="square-list">Vòng lặp i=4; dãy : 1, 3, 6, 9, 2</li>
                                <li class="list">Phần tử đã ắp xếp [0], A[1], A[2], A[3]</li>
                                <li class="list">So ánh phần tử [4]= 2 và {A[0]=1, A[1]=3, A[2]=6,
                                    A[3]=9} để chèn [4] vào dãy để được dãy có 5 phần tử
                                    {A[0], A[1], A[2], A[3], A[4] } t ng dần</li>
                                <li class="list">Do A[4] nhỏ hơn đồng thời [1], [2], A[3] nên dời ch
                                    A[1], A[2], [3] qua một vị trí, [4] thế ch [1] au dời
                                    ch .</li>
                                <li class="list">Ta được 5 phần tử ắp t ng trong dãy 1, 3, 6, 2, 9</li>
    
                            </ul>
                            <p class="des">Vậy dãy au khi ắp xếp t ng 1, 2, 3, 6, 9</p>
                            <p class="des-bold">Đánh giấ giải thuật</p>
                            <p class="des">Với m i bước i, ta cần thực hiện so sánh phần tử hiện tại (a[i])
                                với nhiều nhất là i phần tử và vì i chạy từ 1 tới N - 1 nên ta phải thực
                                hiện nhiều nhất 1 + 2 + … + N - 1 = N(N - 1)/2 tức là O(N2) ph p o
                                ánh tương tự như giải thuật sắp xếp chọn trực tiếp. Tuy nhiên, vòng
                                lặp while không phải lúc nào cũng được thực hiện và nếu thực hiện thì
                                cũng không nhất định là lặp i lần nên trên thực tế giải thuật ắp xếp
                                chèn nhanh hơn o với giải thuật ắp xếp chọn.</p>
                            <p class="des">Trong trường hợp tốt nhất, giải thuật chỉ cần ử dụng đúng N lần
                                o ánh và 0 lần đ i ch . Trên thực tế một dãy bất kỳ gồm nhiều dãy
                                con đã được sắp nên giải thuật chèn hoạt động khá hiệu quả.</p>
                            <p class="des">Giải thuật ắp xếp chèn trực tiếp là giải thuật nhanh nhất trong
                                các giải thuật ắp xếp cơ bản.</p>
                            <h4 class="heading4" id="2.3.1.4">2.3.1.4. Giải thuật sắp xếp n i bọt</h4>
                            <p class="des-bold">Ý tưởng giải thuật</p>
                            <p class="des">Xuất phát từ cuối dãy, đ i ch các cặp phần tử kế cận nhau để
                                đưa phần tử nhỏ hơn hoặc lớn hơn trong cặp phần tử đó về vị trí đúng
                                ở đầu dãy hiện hành, au đó ẽ không x t đến nó ở bước tiếp theo, do
                                vậy ở lần xử lý thứ i sẽ có vị trí đầu dãy là i. Lặp lại xử lý trên cho đến
                                khi không còn cặp phần tử nào để xét.</p>
                            <p class="des-bold">Các bước giải thuật</p>
                            <ul class="list2">
                                <li>Khởi gán i= 0;</li>
                                <li style="text-align: center; margin: 0 auto;">Khởi gán j = N - 1; //Duyệt từ cuối dãy ngược về vị trí i
                                    Trong khi (j > i) thực hiện :
                                    { Nếu (a[j] < a[j-1]) thì
                                    Swap(a[j],a[j-1]); // hoán vị a[j], a[j-1]
                                    j = j - 1;
                                    }
                                </li>
                                <li>i=i+1;</li>
                            </ul>
                            <ul class="list">
                                <li>Nếu i < N thì</li>
                                <li>Lặp lại bước 2</li>
                                <li>Ngược lại</li>
                                <li>Dừng giải thuật.</li>
                            </ul>
                            <p class="des-bold">Cài đặt giải thuật</p>
                            <pre>void BubbleSort(int a[], int N) {
        int i, j;
        for (i = 0; i < N - 1; i++) {
            for (j = N - 1; j > i; j--) {
                if (a[j] < a[j - 1]) {
                    Swap(a[j], a[j - 1]); // hàm hoán vị a[j], a[j-1]
                }
            }
        }
    }
                            </pre>
                            <p class="des">Ví dụ:</p>
                            <p class="des">Giả ử cho dãy ban đầu là A= {5, 6, 2, 2, 10, 12, 9, 10, 9, 3}. Hãy
                                ắp xếp dãy ố đã cho có thứ tự t ng dần</p>
                            <p class="des">Các bước của giải thuật được thực hiện như sau:</p>
                            <img src="/table.jpg" alt="table" style="width: 100%; height: auto;"></img>
                            <p class="des-bold">Đánh giá giải thuật</p>
                            <p class="des">Giải thuật có đô phức tạp là O(N*(N - 1)/2) = O(N2), bằng ố lần
                                o ánh và ố lần đ i ch nhiều nhất của giải thuật (trong trường hợp
                                xấu nhất). Giải thuật ắp xếp n i bọt là giải thuật chậm nhất trong số
                                các giải thuật sắp xếp cơ bản, nó còn chậm hơn giải thuật ắp xếp đ i
                                ch trực tiếp mặc d có ố lần o ánh bằng nhau, nhưng do đ i ch
                                hai phần tử kề nhau nên ố lần đ i ch nhiều hơn</p>
                        </div>
                        <div class="tab-pane" id="CHƯƠNG_3">
                            <h1 class = "heading1">
                                CHƯƠNG 3
                                DANH SÁCH LIÊN KẾT
                            </h1>
                            <h2 class = "heading2" id ="3.1">3.1. DANH SÁCH TUYẾN TÍNH
                            </h2>
                            <h3 class = "heading3" id ="3.1.1">3.1.1. ĐỊNH NGHĨA</h3>
                            <p class ="des">
                                Danh sách tuyến tính là dãy gồm 0 hoặc nhiều hơn các phần tử
                                cùng kiểu cho trước: (a1, a2, … aN), N ≥ 0.
                            </p>
                            <p class ="des">
                                - ai là phần tử của danh sách.
                            </p>
                            <p class ="des">
                                - a1 là phần tử đầu tiên và aN là phần tử cuối cùng.
                            </p>
                            <p class ="des">
                                - N là độ dài danh sách, khi N = 0, ta có danh sách r ng.
                            </p>
                            <p class ="des">
                                Một tính chất quan trọng của danh sách là các phần tử có thể
                                được sắp xếp tuyến tính theo vị trí của chúng trong danh  ách. Như
                                thế, phần tử ai đi trước phần tử ai+1, phần tử ai+1 đi  au phần tử ai và
                                phần tử ai ở vị trí thứ i.
    
                            </p>
                            <p class ="des">
                                Danh sách là một cấu trúc thường gặp nhất, ví dụ như danh  ách
                                sinh viên, danh sách giảng viên, danh sách nhân viên, danh sách các
                                ngành đào tạo trong một trường đại học,…
    
                            </p>
                            <img src="/hinh3.1.jpg" alt="" srcset="">
                            <h1 class ="heading4" id ="3.1.2">3.1.2. Các thao tác trên danh sách
                            </h1>
                            <h1 class ="heading5" id ="3.1.2.1">3.1.2.1. Tìm kiếm một phần tử trong danh sách
                            </h1>
                            <p class ="des">
                                Khi tìm kiếm cần phải biết được thông tin lưu trữ để tìm kiếm.
                                Kết quả của thao tác tìm kiếm là vị trí của phần tử trong danh sách,
                                nếu tìm thấy hoặc là một giá trị mặc định nào đó  ví dụ giá trị 0), nếu
                                không tìm thấy
                            </p>
                            <h1 class ="heading6" id ="3.1.2.2">3.1.2.2. Thêm một phần tử vào danh sách
                            </h1>
                            <p class ="des">
                                Về nguyên tắc, ta có thể thêm phần tử mới vào các vị trí khác
                                nhau trong danh sách, cụ thể là vị trí đầu danh sách, khoảng giữa danh
                                sách hoặc vị trí cuối danh sách. Sau khi hoàn thành thao tác thêm vào
                                thì số phần tử trong danh  ách t ng thêm một phần tử. Chú ý rằng các
                                phần tử liền kề với phần tử thêm vào sẽ bị thay đ i vị trí sau khi thực
                                hiện thao tác thêm.
                            </p>
                            <h1 class ="heading7" id ="3.1.2.3">3.1.2.3. Loại bỏ một phần tử trong danh sách
                            </h1>
                            <p class ="des">
                                Ngược lại với thao tác thêm là thao tác loại bỏ phần tử trong danh
                                sách. Tùy theo nhu cầu mà thao tác loại bỏ phần tử có thể thực hiện
                                theo sau một hay nhiều điều kiện nào đó. Như thế, gắn với thao tác
                                loại bỏ là thao tác tìm kiếm phần tử thỏa mãn điều kiện nào đó và thao
                                tác tìm kiếm sẽ thực hiện trước, và tùy theo kết quả của thao tác tìm
                                kiếm mà thao tác loại bỏ có thể thực hiện hay không. Cụ thể, nếu
                                không tìm thấy phần tử cần loại bỏ (không thỏa mãn điều kiện tìm
                                kiếm đặt ra) thì không thể thực hiện thao tác loại bỏ. Trong trường
                                hợp tìm thấy phần tử cần loại bỏ thì ta thực hiện thao tác loại bỏ, khi
                                đó  ố phần tử trong danh sách giảm đi một phần tử. Chú ý rằng các
                                phần tử đi  au phần tử loại bỏ có thể bị thay đ i vị trí sau khi thực hiện
                                thao tác loại bỏ.
    
                            </p>
                            <h1 class ="heading8" id ="3.1.2.4">3.1.2.4. Thay thế một phần tử của danh sách bởi một phần tử khác
                            </h1>
                            <p class ="des">
                                Thao tác thực hiện thay thế một phần tử của danh sách bởi một
                                phần tử khác thường được thực hiện khi kết hợp với một hay nhiều
                                điều kiện nào đó liên quan đến giá trị của phần tử đã lưu trữ trong danh sách. Như thế, cũng như thao tác loại bỏ, thao tác thay thế cũng
                                thường gắn với thao tác tìm kiếm trước khi tiến hành thay thế.
                            </p>
                            <h1 class ="heading9" id ="3.1.2.5">3.1.2.5. Ghép nhiều danh sách thành một danh sách
                            </h1>
                            <p class ="des">
                                Thao tác này cũng thường được sử dụng nhằm mục đích tạo ra
                                một danh sách lớn hơn, phục vụ cho một yêu cầu nào đó.  ết quả của
                                thao tác ghép này sẽ là một danh  ách mà trong đó đi  au các phần tử
                                của danh sách thứ nhất sẽ là phần tử của danh sách thứ hai và cứ tiếp
                                tục như thế cho các danh sách còn lại. Xét về mặt số phần tử thì số
                                phần tử của danh sách hợp nhất sẽ là t ng của các danh sách. Trong
                                thao tác này vị trí của phần tử trong danh sách sau khi được ghép
                                chung sẽ có sự thay đ i.
                            </p>
                            <h1 class ="heading10" id =3.1.2.6>3.1.2.6. Tách một danh sách thành nhiều danh sách
                            </h1>
                            <p class ="des">
                                Ngược lại với thao tác ghép danh sách là thao tác tách danh sách.
                                Với thao tác này một danh  ách ban đầu được tách thành nhiều danh
                                sách nhỏ hơn t y th o yêu cầu. Khi thực hiện thao tác này cần xác
                                định thông tin về vị trí bắt đầu và vị trí kết thúc khi tách danh sách.
                                Xét về mặt số phần tử thì số phần tử của tất cả các danh sách con sẽ
                                bằng t ng phần tử trong danh  ách ban đầu. Trong thao tác này phần
                                tử trong danh sách khi được tách vào các danh sách khác nhau sẽ có vị
                                trí khác nhau.
                            </p>
                            <h1 class ="heading11" id ="3.1.2.7">3.1.2.7. Sao chép danh sách
                            </h1>
                            <p class ="des">
                                Thao tác này thực hiện sao chép một danh sách nguồn thành
                                một danh  ách đích có c ng  ố phần tử và vị trị các phần tử không
                                thay đi.
                            </p>
                            <h1 class ="heading12" id ="3.1.2.8">3.1.2.8. Sắp thứ tự các phần tử trong danh sách
                            </h1>
                            <p class ="des">
                                Với thao tác này, việc sắp thứ tự các phần tử trong danh sách
                                được thực hiện theo một tiêu chí cho trước phụ thuộc vào thông tin và
                                giá trị của các thông tin đã lưu trữ trong phần tử. Kết quả của thao tác
                                này là sự thay đ i vị trí của các phần tử trong danh  ách ban đầu theo
                                một tiêu chí xác định. Thao tác này không làm thay đ i số phần tử
                                trong danh sách. Có nhiều phương pháp để cài đặt cho thao tác sắp thứ tự và t y th o phương pháp  ử dụng mà có độ phức tạp tính toán và
                                hiệu quả riêng. Việc chọn phương pháp nào phụ thuộc vào đặc điểm,
                                tính chất và yêu cầu của thông tin lưu trữ trong danh sách và bài toán
                                cần giải quyết.
                            </p>
                            <h1 class ="heading13" id ="3.1.3">3.1.3. Biểu diễn danh sách dưới dạng mảng</h1>
                            <p class ="des">
                                Để biểu diễn danh  ách dưới dạng mảng, ta lưu các phần tử của
                                danh sách vào các ô liên tiếp của mảng.
                            </p>
                            <p class ="des">
                                Danh sách sẽ gồm hai thành phần: thành phần 1 là mảng các phần
                                tử và thành phần 2 cho biết vị trí của phần tử cuối cùng trong
                                danh sách.
                            </p>
                            <p class ="des">
                                Về mặt ưu điểm, cách biểu diễn này thuận lợi trong việc truy
                                xuất nhanh đến các phần tử trong danh sách. Tuy nhiên, hạn chế
                                lớn nhất trong cách biểu diễn này đó là không linh hoạt về mặt kích
                                thước danh sách trong mọi trường hợp, do ta không biết trước số
                                phần tử cần thiết phải có trong danh  ách, thông thường ta phải
                                khai báo kích thước tối đa cho mảng để dự phòng, khi đó  ẽ dẫn
                                đến tình trạng lãng phí bộ nhớ. Danh sách liên kết là một cách để
                                khắc phục hạn chế, tạo sự linh hoạt.
                            </p>
                            <h1 class ="heading14" id = "3.2">3.2. DANH SÁCH LIÊN KẾT
                            </h1>
                            <h1 class ="heading15" id ="3.2.1">3.2.1. Định nghĩa
                            </h1>
                            <p class ="des">
                                Cho T là một kiểu được định nghĩa trước, kiểu danh sách Tx
                                gồm các phần tử thuộc kiểu T được định nghĩa là  Tx = < Vx,
                                Ox>, trong đó:
                            </p>
                            <p class ="des">
                                - Vx = {tập hợp có thứ tự các phần tử có kiểu dữ liệu T được liên
                                    kết với nhau theo trình tự tuyến tính}
                            </p>
                            <p class ="des">
                                - Ox = {Tạo danh sách; Tìm một phần tử trong danh sách; Chèn
                                    một phần tử vào danh sách; Loại một phần tử khỏi danh sách; Tìm
                                    kiếm; Sắp xếp danh sách; ...}
                            </p>
                            <p class ="des">
                                Mối liên hệ giữa các phần tử trong danh  ách được thể hiện tường
                                minh: m i phần tử ngoài các thông tin về bản thân còn chứa một địa
                                chỉ đến phần tử kế trong danh  ách nên được gọi là danh sách liên kết.
                            </p>
                            <p class ="des">
                                Do có liên kết tường minh, với hình thức này các phần tử trong
                                danh sách không cần lưu trữ kế cận trong bộ nhớ nên khắc phục được
                                các khuyết điểm của hình thức t chức mảng, nhưng việc truy xuất
                                đến một phần tử đòi hỏi phải thực hiện truy xuất qua một số phần tử
                                khác.
                            </p>
                            <p class ="des">
                                Có nhiều kiểu t chức liên kết giữa các phần tử trong danh sách:
                            </p>
                            <p class ="des">
                                - Danh sách liên kết đơn là danh  ách mà m i phần tử trong danh
                                    sách chỉ liên kết với phần tử đứng sau nó trong danh sách.
                            </p>
                            <img src="/hinhanh1.jpg" alt="" srcset="">
                            <p class ="des">
                                - Danh sách liên kết kép là danh sách mà m i phần tử trong danh
                                sách liên kết với phần tử đứng trước và sau nó bằng hai mối liên kết.
                            </p>
                            <img src="/hinhanh2.jpg" alt="" srcset="">
                            <p class ="des">
                                - Danh sách liên kết vòng là danh sách mà phần tử đứng cuối
                                danh sách lại liên kết với phần tử đầu danh sách theo dạng danh sách
                                liên kết đơn hoặc danh sác kép.
                            </p>
                            <img src="/hinhanh3.jpg" alt="" srcset="">
                            <p class ="des">
                                Hình thức liên kết này cho phép các thao tác thêm, hủy trên danh
                                sách được thực hiện dễ dàng, phản ánh được bản chất linh động của danh sách.
                            </p>
    
                        </div>
                        <div class="tab-pane" id="CHƯƠNG_4">
                            
                            <h1 class="heading1 tab-pane">
                                CHƯƠNG 4 
                                NGĂN XẾP  HÀNG ĐỢI 
                            </h1>
                            <h2 class="heading2">
                                4.1. NGĂN XẾP
                            </h2>
                            <h3 class="heading3">
                                4.1.1. Định nghĩa 
                            </h3>
                            <p class="des">
                                Ngăn xếp (stack) là một cấu trúc dữ liệu trừu tượng hoạt động 
                            theo nguyên lý "vào sa  ra  rước" (Last In First Out – LIFO,  nghĩa là 
                            dữ liệu được nạp vào ng n xếp trước sẽ được xử lý sau cùng và dữ 
                            liệu được nạp vào sau cùng lại được xử lý đầu tiên). 
                            </p>
                            <p class="des">
                                Nói một cách khác, ng n xếp là một cấu trúc dữ liệu dạng thùng 
                            chứa của các phần tử và trên đó có hai thao tác cơ bản: Push và 
                            Pop. Thao tác Push b  sung một phần tử vào đỉnh của ng n xếp, nghĩa 
                            là sau các phần tử đã có trong ng n xếp. Trong khi đó, thao tác 
                            Pop lấy ra và trả về phần tử đang đứng ở đỉnh của ng n xếp. 
                            </p>
                            <p class="des">
                                Trong ngăn xếp, các đối tượng có thể được thêm vào bất kỳ lúc 
                            nào nhưng chỉ có đối tượng thêm vào sau cùng mới được phép lấy ra 
                            khỏi ng n xếp 
                            </p>
                            <p class="des">
                                Hình minh họa dưới đây mô tả cách thức hoạt động của ng n xếp 
                            với hai thao tác Push và Pop trên ngăn xếp các phần tử là các số 
                            nguyên.
                            </p>
                            <img src="/chuong4.1.jpg" alt="" srcset="">
                            <h3 class="heading3">
                                4.1.2 Các thao tác trên ngăn xếp 
                            </h3>
                            <p class="des">
                                Các thao tác trên ngăn xếp bao gồm : 
                            </p>
                            <p class="des">
                                - Thao tác Push(object): thêm một phần tử vào ngăn xếp
                            </p>
                            <p class="des">
                                -Thao tác Pop(): lấy một phần tử ra khỏi ng n xếp và trả lại giá trị phần tử  
                            </p>
                            <p class="des">
                                Thao tác Top(): trả lại vị trí phần tử nạp sau cùng vào ngăn xếp 
                            </p>
                            <p class="des">
                                -Thao tác Size(): trả lại số lượng phần tử được lưu trong ngăn xếp
                            </p>
                            <p class="des">
                                Thao tác isEmpty(): kiểm tra xem có phải ngăn xếp rỗng không.
                            </p>
                        <h3 class="heading3">
                            4.1.3 Ứng dụng với ngăn xếp
                        </h3>
                        <p class="des">
                            Dựa theo cách thức t  chức, cơ chế hoạt động của ng n xếp, ta có 
    thể xây dựng nhiều ứng dụng đa dạng, như  
                        <p class="des">
                            -Xây dựng ứng dụng theo dõi lịch sử duyệt trang trong trình 
    duyệt web.
                        </p>
                        <p class="des">
                            -Xây dựng chức n ng Undo trong phần mềm soạn thảo v n bản 
    hoặc các phần mềm khác cần chức n ng phục hồi lại một thao 
    tác đã thực hiện trước đó
                        <p class="des">
                            -Xây dựng ứng dụng đổi cơ số
                        </p>
                        <p class="des">
                            -Xây dựng ứng dụng trong cài đặt chương trình dịch.
                        </p>
                        <p class="des">
                            -Xây dựng chương trình kiểm tra tính hợp lệ của các dấu ngoặc 
                            trong biểu thức.
                        </p>
                        <p class="des">
                            -Sử dụng trong khử đệ quy khi lập trình.
                        </p>
                        <p class="des">
                            - … 
                        </p>
                        <h3 class="heading3">
                            4.1.4 Cài đặt ngăn xếp 
                        </h3>
                        <p class="des">
                            Có hai cách cài đặt ngăn xếp:
                        </p>
                        <p class="des">
                            -Cài đặt ngăn xếp dùng mảng  
                        </p>
                        <img src="/hinh4.1.4.1.jpg" alt="" srcset="">
                        <p class="des">
                            Cách đơn giản nhất để cài đặt ng n xếp là dùng mảng. Ta nạp các 
    phần tử theo thứ tự từ trái sang phải. Có biến lưu giữ chỉ số của phần 
    tử ở đầu ngăn xếp.Thao tác cài đặt ng n xếp dùng mảng được thực 
    hiện qua các bước sau :
                        </p>
                        <p class="des">
                            Bước 1:  Khai báo cấu trúc dữ liệu của ngăn xếp 
    typedef struct tagStack  
    { int a[max]; 
    int t; 
    }Stack;
                        <p class="des">
                        Bước 2 : Viết các hàm thực hiện các  hao  ác  rên ngăn xếp, bao 
    gồm các thao tác chính : 
     Thao tác khởi tạo ngăn xếp 
     Thao tác kiểm tra ngăn xếp có rỗng không 
     Thao tác thêm phần tử vào ng n xếp 
     Thao tác kiểm tra ng n xếp có đầy hay không  
     Thao tác lấy phần tử ra khỏi ngăn xếp - 
    Hàm khởi tạo ngăn xếp 
    void CreateStack(Stack &s) 
    {  
    s.t=-1;
                        </p>
                        <Pp class="des">
                            -Hàm kiểm  ra ngăn xếp có đầy hay không ?
                        </Pp>
                        <p class="des">
        int IsFull(Stack s)  
            {   if(s.t>=max) 
        return 1; 
        else 
        return 0; 
        } -  Hàm  thêm  phần  tử vào ngăn xếp  
        int Push(Stack &s, int x) 
        {  
        if (IsFull(s)==0) 
        {   s.t++; 
        s.a[s.t]=x; 
        return 1; 
        }
        </p>
            <p class="des">
                else 
                return 0; 
        } -  Hàm lấy  hần  ử ra khỏi ngăn xế  
        int Pop(Stack &s, int &x) 
        {   
            if (IsEmpty(s)==0) 
        { x=s.a[s.t]; 
            s.t--; 
            return 1; 
        } 
        else return 0; 
        }
                </p>
                <h3 class="heading3">
                    4.1.4.2.  Cài đặt ngăn xếp dùng danh sách liên kết
                </h3>
                <p class="des">
                    Thao tác cài đặt ng n xếp dùng danh sách liên kết được thực hiện 
        qua các bước sau 
                </p>
                <p class="des">
                        Bước 1:  Khai báo cấu trúc dữ liệu của ngăn xếp 
            struct StackNode  
            {  float item;  
            StackNode *next;  
                }; 
            struct Stack  
            { StackNode *top; 
                };
                    </p>
                        <p class="des">
                                Bước 2 : Viết các hàm thực hiện các  hao  ác  rên ngăn xếp,cũng 
        bao gồm các thao  tác như  hực hiện trên cấu trúc mảng 
                            </p>
                                <p class="des">
                                     Thao tác khởi tạo ngăn xếp 
                                </p>
                                <p class="des">
                                     Thao tác kiểm tra ng n xếp có rỗng không
                                </p>
                                <p class="des">
                                     Thao tác thêm phần tử vào ngăn xếp
                                </p>
                                <p class="des">
                                     Thao tác kiểm tra ngăn xếp có đầy hay không 
                                </p>
                                <p class="des">
                                     Thao tác lấy phần tử ra khỏi ngăn xếp
                                </p>
                                <p class="des">
                                        -  Hàm khởi tạo ngăn xếp 
        Stack *StackConstruct ()  
        {  
        Stack *s; 
        s = (Stack *)malloc (sizeof (Stack)); 
        if (s == NULL)  
        return NULL;  
        s->top = NULL; 
        return s; 
        }
                                </p>
                                <p class="des">
                                    -  Hàm hủy ngăn xếp 
    void StackDestroy (Stack *s)  
    {  
    while (!SatckEmpty(s))  
    { StackPop(s); 
    free (s); 
    } 
    }
                                </p>
                                <p class="des">
                                    - Hàm kiểm tra ngăn xếp rỗng hay không 
    int StackEmpty (const Stack *s)  
    {  
    return (s->top == NULL); 
    } -  Hàm kiểm tra ngăn xếp có đầy hay không 
    int StackFull()  
    {  
    } 
    getch(); 
    return 1
                                </p>
                                <p class="des">
                                    - Hàm đưa  hần tử vào ngăn xếp 
    int StackPush (Stack *s, float item)  
    {  
    StackNode *node; 
    node = (StackNode *)malloc(sizeof(StackNode));  
    if (node == NULL)  
    { 
    } 
    StackFull(); 
    return 1;  // tràn ngăn xếp 
    node->item = item;  
    node->next = s->top;
                                </p>
                                <p class="des">
                                    s->top = node;  
    return 0; 
    } - Hàm lấy phần tử ra khỏi ngăn xếp
                                </p>
                                <p class="des">
                                        float StackPop (Stack *s)  
        {  
        float item; 
        StackNode *node; 
        if (StackEmpty (s))   
        return NULL; 
        node = s->top;  
        item = node->item;  
        s->top = node->next;  
        free (node);  
        return item; 
                            <h2 class="heading2">
                                4.2. HÀNG ĐỢI
                            </h2>
                    <h3 class="heading3">
                        4.2.1. Định nghĩa  
                    </h3>
                    <p class="des">
                        Hàng đợi (queue) là một cấu trúc dữ liệu dùng để chứa các đối 
    tượng dữ liệu, hoạt động theo cơ chế FIFO (First In First Out - nghĩa 
    là dữ liệu được nạp vào hàng đợi trước sẽ được xử lý trước). 
                    </p>
                        <p class="des">
                        Các đối tượng có thể được thêm vào hàng đợi bất kỳ lúc nào và ở 
                        vị trí cuối hàng đợi, chỉ có đối tượng thêm vào đầu tiên mới được 
                        phép lấy ra khỏi hàng đợi đầu tiên. Thao tác thêm vào và lấy một đối 
                        tượng ra khỏi hàng đợi được gọi là "enqueue" và "dequeue".  
                        </p>
    
                    </p>
                    <img src= "/chuong4.2.jpg" alt="" srcset="">
                    <p class="des">
                        Cấu trúc dữ liệu hàng đợi có nhiều ứng dụng giúp h  trợ giải 
    quyết các bài toán trong tin học như: khử đệ quy, lưu vết các quá 
    trình tìm kiếm theo chiều rộng, quay lui, vét cạn, t  chức quản lý và 
    phân phối tiến trình trong các hệ điều hành, t  chức bộ đệm bàn 
    phím…. 
                    </p>
                    <h3 class="heading3">
                        4.2.2. các thao tác trên hàng dợi  
                    </h3>
                    <p class="des">
                        Tương tự như ng n xếp, hàng đợi h  trợ các thao tác:
                    </p>
                    <p class="des"> 
                         EnQueue (obj)  thêm đối tượng obj vào cuối hàng đợi. 
                    </p>
                    <p class="des">
                         DeQueue(): lấy đối tượng ở đầu hàng đợi ra khỏi hàng đợi và 
    trả về giá trị của nó. Nếu hàng đợi r ng thì lỗi sẽ xảy ra. 
                    </p>
                    <p class="des">
                         IsEmpty(): kiểm tra xem hàng đợi có rỗng không. 
                    </p>
                    <p class="des">
                         Front(): trả về giá trị của phần tử nằm ở đầu hàng đợi mà 
    không hủy nó. Nếu hàng đợi rỗng thì lỗi sẽ xảy ra.
                    </p>
                    <h3 class="heading3">
                        4.2.3. cài đặt hàng đợi
                    </h3>
                    <p class="des">
                        Có 2 cách cài đặt hàng đợi: cài đặt hàng đợi dùng mảngvà dùng 
    danh sách liên kết. 
                    </p>
                    <h3 class="heading3">
                        4.2.3.1.  Cài đặt hàng đợi sử dụng mảng 
                    </h3>
                    <p class="des">
                        a. Sử dụng mảng thông thường 
                        <p class="des">
                            Bước 1:  Khai báo cấu trúc dữ liệu hàng đợi - Khai báo mảng các phần tử 
    #define MAX 20 // giả sử dùng mảng gồm 20 phần tử
                        </p>
    
                    </p>
                    <p class="des">
                        - Khai báo kiểu dữ liệu lưu trữ trong hàng đợi
                    </p>
                    <p class="des">
                        typedef <Kiểu dữ liệu> El_type;  
                    </p>
                    <p class="des">
                        - Định nghĩa cấu trúc dữ liệu hàng đợi Queue
                    </p>
                    <p class="des">
                        - Định nghĩa cấu trúc dữ liệu hàng đợi Queue
                    </p>
                    <p class="des">
                        typedef struct Queue 
                        { 
                            El_type el[MAX]; 
                            int front; 
                            int rear; 
                        } Queue;    
                    </p>
                    <p class="des">
                    Bước 2 : Viết các hàm thực hiện các  hao  ác  rên hàng đợi
                    </p>
                    <p class="des">
                    - Hàm khởi tạo hàng đợi ban đầu 
                    </p>
                    <p class="des">
                        Eltype *initQ(Queue *q) 
                        { 
                            q = (Queue *)malloc(sizeof(Queue)); 
                            if (q != NULL)  
                                { q->front = -1; 
                                q->rear = -1; 
                                } 
                            return q;  
                        } 
                    </p>
                    <p class="des">
                    - Hàm kiểm  ra xem hàng đợi có rỗng không? 
                    </p>
                    <p class="des">
                        int isEmpty(Queue *q) 
                        { 
                            return (q->front == -1); 
                        }
                        <p class="des">
                            - Hàm kiểm tra xem hàng đợi có đầy không? 
                        </p>
                    <p class="des">
                    int isFull(Queue q) 
                    { 
                        return (q.rear-q.front+1 == MAX); 
                    } 
                    - Hàm thêm một phần tử vào hàng đợi 
                    void enQ(El_type new_el, Queue *q) 
                    { 
                        if (!isFull(q)) 
                        { if (isEmpty(q))  
                            q->front = q->front+1; 
                        q->rear = q->rear+1; 
                        q->el[q->rear] = new_el; 
                        } 
                else 
                        printf("Hàng đợi đầy.\n"); 
                    }
                    </p>
                    <p class="des">
                        - Hàm xóa một phần tử khỏi hàng đợi
                    </p>
                    <p class="des">
                        void deQ(Queue *q) 
                        { 
                                if (!isEmpty(q))  
                        119 
                        
                                    q->front = q->front+1;    
                                else 
                                    printf("Hàng đợi trống.\n"); 
                        } 
                            
                    </p>
                    <p class="des">
                        Nhận xét :  
                        Qua mỗi lần xóa, phần sử dụng được của mảng sẽ giảm đi  (do giá 
                        trị biến front t ng lên). Trong trường hợp đó, có thể khắc phục bằng 
                        cách sử dụng mảng vòng.
                    </p>
                    <h1 class="heading1">
                        b. Sử dụng mảng vòng
                    </h1>
                    <p class="des">
                        - Hàm khởi tạo hàng đợi
                    </p>
                    <p class="des">
                        Eltype *initQ(Queue *q) 
                        { 
                            q = (Queue *)malloc(sizeof(Queue)); 
                            if (q != NULL)  
                                { q->front = -1; 
                                    q->rear = -1; 
                                } 
                            return q; 
                        } - Hàm kiểm  ra xem hàng đợi có rỗng không?  
                        int empty_queue(queue q) 
                        { 
                            return q.front==-1; 
                        } 
                    </p>
                    <p class="des">
                        - Thao tác kiểm  ra xem hàng đợi có đầy không?
                    </p>
                    <p class="des">
                        int full_queue(queue q) 
                        { 
                            return ((q.rear-q.front+1) % maxlength==0); 
                        } 
                    </p>
                    <p class="des">
                        - Hàm đưa  hêm một phần tử vào hàng đợi 
                    </p>
                    <p class="des">
                        void enqueue(elementtype x,queue *q) 
                        { 
                            if (!full_queue(*q)) 
                            {   if (empty_queue(*q))  
                                        q->front=0; 
                                    q->rear=(q->rear+1) % maxlength; 
                                    q->data[q->rear]=x;     
                                } 
                            el   printf ("Hàng đợi đầy!"); 
                        } 
                    </p>
                    <p class="des">
                        -Hàm xóa một phần tử khỏi hàng đợi
                    </p>
                    <p class="des">
                        void dequeue(queue *q) 
                            { 
                                if (!empty_queue(*q)) 
                                {  if (q->front==q->rear)  
                                        makenull_queue(q); 
                                    else  
                                        q->front=(q->front+1) % maxlength; 
                                } 
                            else   printf "Hàng đợi rỗng";
                            }
                    </p>
                        <p class="des">
                            Nhận xét : 
                        </p>
                            <p class="des">
                                Mặc d  phương pháp  ử dụng mảng vòng có thể tận dùng toàn bộ 
    các mảng đã được cấp pháp ban đầu nhưng khi mảng đầy thì không 
    thể thêm phần tử vào hàng được nữa. Trong trường hợp này, có thể 
    khắc phục bằng cách sử dụng danh sách liên kết để mở rộng. 
                            </p>
                            <p class="des">
                                4.2.3.2. c ài đặt hàng đợi dùng danh sách liên kết 
                            </p>
                            <p class="des">
                                Bước 1:  Khai báo cấu trúc dữ liệu hàng đợi
                            </p>
                            <p class="des">
                                - Khai báo kiểu dữ liệu lưu trữ trong hàng đợi 
                            </p>
                            <p class="des">
                                - Định nghĩa cấu trúc dữ liệu hàng đợi Queue
                            </p>
                            <p class="des">
                                    typedef struct node 
            { elementtype data; 
            node* next; 
            }; 
            typedef node* position; 
            typedef struct queue 
            {  position front,rear;  
            };
                            </p>
                                <p class="des">
                                    Bước 2 : Viết các hàm thực hiện các  hao  ác  rên hàng đợi 
                                </p>
                                <p class="des">
                                    - Hàm khởi tạo hàng đợi
                                </p>
                                <p class="des">
                                    void makenull_queue(queue *q) 
            { q->front=(node*)malloc(sizeof(node)); 
                q->front->next=NULL; 
                q->rear=q->front; 
    122 
        
            } 
        - Hàm xem hàng đợi có rỗng không?  
        int empty_queue(queue q) 
        { 
            return (q.front==q.rear); 
        }
                                </p>
                                <p class="des">
                                    - Hàm đưa  hêm một phần tử vào hàng đợi
                                </p>
                                <p class="des">
                                    void enqueue(elementtype x, queue *q) 
                                    { 
                                        q->rear->next=(node*)malloc(sizeof(node)); 
                                        q->rear=q->rear->next; 
                                        q->rear->data=x; 
                                        q->rear->next=NULL;  
                                    }
                                </p>
                                <p class="des">
                                    - Hàm xóa một phần tử khỏi hàng đợi
                                </p>
                                <p class="des">
                                    void dequeue(queue *q) 
                                    { 
                                        position t; 
                                        t=q->front; 
                                        q->front=q->front->next; 
                                        free(t);
                                    }
                                </p>
                                <p class="des">
                                    Nhận xét :  
                                </p>
                                <p class="des">
                                    Khi sử dụng hàng đợi bằng cách cài đặt thông qua danh sách liên 
    kết giúp khắc phục được tình trạng đầy của việc sử dụng mảng để cài 
    đặt hàng đợi, tuy nhiên thao tác trên danh sách phức tạp hơn  o với 
    dùng mảng.
                                </p>
                                <h1 class="heading1">
                                BÀI TẬP CHƯƠNG 4
                                </h1>
                                <p class="des">
                                1. 
    Giả sử cho hàm push(a) là hàm thực hiện nạp a vào ng n xếp và 
    hàm pop() là hàm lấy phần tử ra khỏi ng n xếp. Giả sử cho dãy 
    thao tác  au đ y, biết rằng ng n xếp ban đầu được khởi tạo r ng :  
    push(5), push(3), pop(), push(2), push(8), pop(), pop(), pop(), 
    push(9), push(1), pop(), push(7), push(6), pop(), pop(), push(4), 
    pop(), pop(). 
    Hãy viết ra dãy phần tử của danh của ng n xếp (chỉ rõ vị trí đầu 
    ng n xếp) sau khi thực hiện m i thao tác. 
                                </p>
                                <p class="des">
                                2.  
    Giả sử cho hàm enq(a) là hàm thực hiện nạp a vào hàng đợi và 
    hàm deq() là hàm thực hiện lấy phần tử ra khỏi hàng đợi. Giả sử 
    cho dãy các thao tác  au đ y, biết rằng hàng đợi ban đầu được 
    khởi tạo rỗng: 
                                </p>
                                <p class="des">
                                enq(5), enq(3), deq(), enq(2), enq(8), deq(), enq(9), enq(1), deq(), 
    enq(7), enq(6), deq(), deq(). enq(4), deq(), deq(). 
    Hãy viết ra dãy các phần tử của hàng đợi (chỉ rõ vị trí đầu và cuối 
    của hàng đợi) sau khi thực hiện m i thao tác.
                                </p>
                                <p class="des">
                                    3.Hãy trình bày cách sử dụng ng n xếp để chuyển biểu thức dạng 
                                    trung tố  au đ y về dạng biểu thức hậu tố: 
                                    a. a – b * c ^ d + f 
                                    b. 1 + 2 + 3 * 4 + 5 – 6 * 7 + 8 
                                </p>
                                    <p class="des">
                                        4. 
    Hãy trình bày cách tính giá trị của biểu thức hậu tố  au đ y nhờ 
    sử dụng ng n xếp: 
    a. 1 2 + 3 1 + * 1 1 + 1 + / 
    b. 3 4 + 3 5 + * 7 + 8 *
                                    </p>
                                    <p class="des">
                                        5.Viết chương trình nhập vào một số nguyên không âm bất kỳ, sau 
                                        đó hiển thị lên màn hình số đảo ngược thứ tự của số nguyên vừa 
                                        nhập vào (ví dụ: nếu nhập số 12567, hiển thị lên màn hình số 
                                        76521) bằng cách: 
                                    </p>
                                    <p class="des">
                                        a. Sử dụng ng n xếp 
    b. Sử dụng hàng đợi
                                    </p>
                                    <p class="des">
                                        6.Viết chương trình chuyển đ i một số nguyên N trong hệ thập 
                                        phân (hệ 10) sang biểu diễn ở các hệ sau, sử dụng ng n xếp: 
                                        a. Hệ nhị phân (hệ 2) 
                                        b. Hệ thập lục phân (hệ 16) 
                                        c. Hệ bát phân (hệ 8)
                                    </p>
                                    <p class="des">
                                        7.Hãy viết chương trình mô phỏng cho bài toán  Tháp Hà Nội  
                                        bằng cách sử dụng ng n xếp. 
                                        Có thể vận dụng ng n xếp hoặc 
                                    </p>
                                    <p class="des">
                                        8.Có thể vận dụng ng n xếp hoặc hàng đợi để khử đệ quy trong giải 
                                        thuật sắp xếp Quick sort không? Nếu có giải thích vì sao ?
                                    </p>
                                    <p class="des">
                                        9.Có thể vận dụng ng n xếp hoặc hàng đợi để khử đệ quy trong giải 
                                        thuật sắp xếp Merge sort không? Nếu có giải thích vì sao ? 
                                    </p>
                                    <p class="des">
                                        10.Viết chương trình tìm tất cả các cặp dấu ngoặc tương ứng trong 
                                        một chương trình viết bằng ngôn ngữ C/C++.
                                    </p>
    
    
                        </div>
                        <div class="tab-pane" id="CHƯƠNG_5">
                            <h1 class="heading1 tab-pane">
                                CHƯƠNG 5
                                CÂY
                            </h1>
                            <h2 class="heading2">5.1. ĐỊNH NGHĨA VÀ C C KH I NIỆM</h2>
                            <h3 class="heading3">5.1.1 Định nghĩa ây</h3>
                            <p class="des"> y được định nghĩa là tập hợp hữu hạn các nút, được t chức
                                theo cấu trúc phân cấp, trong đó có một nút đặc biệt được gọi là nút
                                gốc (root) và tập hợp các nút còn lại nối với nút gốc thông qua các
                                nhánh trên cây gọi là các nút con và các nút lá. Nút lá là nút tận cùng
                                của cây.</p>
                            <p class="des">Hình bên dưới là cấu trúc t chức của c y, trong đó R là nút gốc,
                                R1, R2,..Rk là các nút con của nút gốc R, các nút T1, T2, T3 là các nút
                                lá. y trong hình bên dưới là cây bao gồm k nhánh.</p>
                            <img style="width: 100%;" src="/pic1.jpg" alt="">
                            <p class="des --center"><b>Hình 5.1.</b> Cấu trúc cây</p>
                            <p class="des">Một số ví dụ hình ảnh của cấu trúc cây trong thực tế:</p>
                            <img style="width: 100%;" src="/pic2.jpg" alt="">
                            <p class="des --center"><b>Hình 5.2.</b> Cây gia phả</p>
                            <img style="width: 100%;" src="/pic3.jpg" alt="">
                            <p class="des --center"><b>Hình 5.3.</b> Cây cấu trúc t chức trong một công ty</p>
                            <img style="width: 100%;" src="/pic4.jpg" alt="">
                            <p class="des --center"><b>Hình 5.4.</b> Cây cấu trúc t chức các chương mục trong một cuốn sách
                            </p>
                            <h3 class="heading3">5.1.2. Các khái niệm trên cây</h3>
                            <p class="des">- Nút gốc – root: Nút gốc là nút trên cùng của cây theo thứ tự
                                phân cấp trong c y. Điều đó có nghĩa là nếu một nút được gọi là nút
                                gốc thì nút này không có nút nào ở trên nó trong phân cấp của cây.</p>
                            <p class="des">- Nút lá (leaf): Một nút không có nút con được gọi là nút lá</p>
                            <p class="des">- Nút con (child): Một nút gọi là nút con khi mà trên nó có một
                                nút khác theo thứ tự phân cấp</p>
                            <p class="des">- Nút cha (parent): Một nút được gọi là nút cha nếu tồn tại một
                                nút là nút con của nó theo thứ tự phân cấp</p>
                            <p class="des">- Tổ tiên (ancestors) và Hậu duệ (descendants): Nếu có đường đi
                                từ nút a đến nút b, thì nút a được gọi là nút t tiên (ancestor) của b,
                                còn b được gọi là nút hậu duệ (descendant) của nút a.</p>
                            <p class="des">- Nút anh em (sibling): Các nút có cùng nút cha được gọi là nút
                                anh em.</p>
                            <p class="des">- Chiều cao (height): Chiều cao của nút trên cây bằng độ dài
                                đường đi dài nhất từ nút đó đến lá cộng 1</p>
                            <p class="des">- Đường đi (path): Nếu n<sub>1</sub>, n<sub>2</sub>, …, nk là dãy nút trên cây
                                sao cho n<sub>i</sub>
                                là cha của n<sub>i + 1</sub> với 1 ≤ i ≤ k, thì dãy này được gọi là đường đi từ nút
                                n<sub>1</sub>
                                đến n<sub>k</sub>.</p>
                            <p class="des">- Độ dài (length) của đường đi bằng số lượng nút trên đường đi
                                trừ bớt đi 1. Như vậy, đường đi độ dài 0 là đường đi từ một nút đến
                                chính nó.</p>
                            <p class="des">- Độ sâu/ mức (depth/level) độ sâu của nút là độ dài của đường
                                đi duy nhất từ gốc cộng thêm 1</p>
                            <p class="des">- Cây con (subtree) của một cây là một nút cùng với tất cả các
                                hậu duệ của nó.</p>
                            <img style="width: 100%;" src="/pic5.jpg" alt="">
                            <p class="des --center"><b>Hình 5.5.</b>Ví dụ một cây con b và các nút con của cây b: e, f, i, j
                            </p>
                            <img style="width: 100%;" src="/pic6.jpg" alt="">
                            <p class="des --center"><b>Hình 5.6.</b>Đường đi trên c y, đường đi 1: từ a qua b, qua f và đến
                                i</p>
                            <img style="width: 100%;" src="/pic7.jpg" alt="">
                            <p class="des --center"><b>Hình 5.7.</b>Chiều cao và độ sâu trên cây</p>
                            <h3 class="heading3">Hình 5.1.3 Cây có thứ tự</h3>
                            <p class="des">Trên cây, các nút được sắp xếp ở các vị trí khác nhau và từ đó
                                chúng ta có các cây khác nhau.Ví dụ dưới đây minh họa hai cây
                                khác nhau.</p>
                            <img style="width: 100%;" src="/pic8.jpg" alt="">
                            <p class="des --center"><b>Hình 5.8.</b>Ví dụ hai cây bố trí các nút ở vị trí khác nhau </p>
                            <p class="des">Cây với các nút được sắp xếp có thứ tự được gọi là cây có thứ tự, ta sẽ xét chủ
                                yếu là cây có thứ tự. Vì vậy, tiếp theo đây thuật ngữ cây
                                là chỉ để chỉ cây có thứ tự. Khi muốn khẳng định không quan tâm đến
                                thứ tự, ta sẽ phải nói rõ là cây không có thứ tự.</p>
                            <h3 class="heading3">5.1.4 Duyệt theo thứ tự</h3>
                            <p class="des">Có ba cách để duyệt cây theo thứ tự là thứ tự trước, giữa và sau.</p>
                            <b style="line-height: 0px;" class="des">Duyệt theo thứ tự trước</b>
                            <h3 style="margin: 0;">Duyệt theo thứ tự trước (Preorder Traversal) của các nút thuộc cây
                                <br>T :
                            </h3>
                            <p class="des">- Gốc R của T </p>
                            <p class="des">- Tiếp đến là các nút của T1 (là con của nút R) theo thứ tự trước</p>
                            <p class="des">- Sau đó là các nút của T2 (là con của nút R) theo thứ tự trước;</p>
                            <p class="des">- …</p>
                            <p class="des">- Và cuối cùng là các nút của Tk (là con của nút R) theo thứ
                                tự trước.</p>
                            <i class="des">Thuật toán duyệt theo thứ tự rước</i>
                            <p class="des">void PREORDER (nodeT r)</p>
                            <p class="des">{</p>
                            <p class="des">Xuất ra giá trị của nút R;</p>
                            <p class="des --center">Vòng lặp (mỗi nút con C của nút gốc R, nếu có, theo thứ tự
                                từ trái sang) thực hiện :</p>
                            <p class="des"> }</p>
                            <b class="des">Duyệt theo thứ tự sao</b>
                            <h3 style="margin: 0;">Duyệt theo thứ tự sau (Postorder Traversal) của các nút của cây T:</h3>
                            <p class="des">- Các nút của T1 theo thứ tự sau;</p>
                            <p class="des">- Tiếp đến là các nút của T2 theo thứ tự sau;</p>
                            <p class="des">- …;</p>
                            <p class="des">- Các nút của Tk theo thứ tự sau;</p>
                            <p class="des">- Sau cùng là nút gốc R.</p>
                            <p class="des">Thuật toán duyệt theo thứ tự sau</p>
                            <p class="des">void POSORDER (nodeT r)</p>
                            <p class="des">{</p>
                            <p class="des">Xuất ra giá trị của nút R;</p>
                            <p class="des">Vòng lặp (mỗi nút con C của nút gốc R, nếu có, theo thứ tự
                                từ trái sang) thực hiện :</p>
                            <p class="des">Gọi hàm PREORDER(C);</p>
                            <p class="des"> }</p>
                            <b class="des">Duyệt theo thứ tự giữa</b>
                            <h3 style="margin: 0;">Duyệt theo thứ tự giữa (Inorder Traversal) của các nút của cây T :</h3>
                            <p class="des">- Các nút của T1 theo thứ tự giữa;</p>
                            <p class="des">- Tiếp đến là nút gốc R.</p>
                            <p class="des">- Tiếp theo là các nút của T<sub>2</sub>, …, T<sub>k</sub>, m i nhóm nút được xếp
                                theo thứ tự giữa.</p>
                            <p class="des">void INORDER (nodeT r)</p>
                            <p class="des"> {</p>
                            <p class="des">Nếu (R là lá)<br>
                                <p style="margin-left: 30px;" class="des">Xuất ra giá trị của nút R;</p>
                            </p>
                            <p class="des">Ngược lại</p>
                            <p style="margin-left: 50px;" class="des --center">{ Gọi hàm INORDER (con trái nhất của R);</p>
                            <p style="margin-left: 50px;" class="des">Xuất ra giá trị của nút R;</p>
                            <p style="margin-left: 50px;" class="des --center">Vòng lặp (m i nút con của nút R, ngoại trừ con trái 
                                nhất, theo thứ tự từ trái sang) thực hiện :</p>
                            <p style="margin-left: 70px;" class="des">Gọi hàm INORDER (c);</p>
                            <p style="margin-left: 50px;" class="des"> }</p>
                            <p class="des"> }</p>
                            <p class="des">Ví dụ:</p>
                            <p class="des">Giả sử cho cây, bao gồm các nút a, b, c, d, e, k, g, h, i, l như hình 
                                như sau :</p>
                            <img style="width: 100%;" src="/pic9.jpg" alt="">
                            <p class="des">Thứ tự duyệt cây theo thứ tự trước, giữa và sau sẽ được kết quả
                                như sau:</p>
    
                        </div>          
                        <div class="tab-pane" id="CHƯƠNG_6">
                                <h1 class="heading1">CHƯƠNG 6: BẢNG BĂM</h1>
                                <h2 class="heading2" id="6.1">6.1. BẢNG BĂM</h2>
                                <h3 class="heading3" id="6.1.1">6.1.1. Định nghĩa </h3>
                                <p class="des">Bảng băm (hash table) là phương pháp tham chiếu trực tiếp một phần tử trong trong bảng lưu dữ liệu thông qua việc biến đ i số học trên khóa của phần tử để có được địa chỉ tương ứng của phần tử đang xét ở trong bảng.</p>
                                <p class="des">Như thế, giả sử các khóa là những số nguyên từ 1 đến N thì có thể
                                    lưu phần tử thứ i ở vị trí thứ i của bảng và có thể truy xuất trực tiếp
                                    các phần tử này bằng giá trị khóa của phần tử. Điều đó cho thấy bảng
                                    b m là một trong những phương pháp tìm kiếm hữu hiệu.</p>
                                <p class="des">Về mặt toán học, bảng b m là một ánh xạ H từ tập các khóa K
                                    vào tập các địa chỉ A: H: K → A
                                </p>        
                                <p class="des">Trong bảng b m, thông thường tập các khóa lớn hơn rất nhiều so
                                    với tập các địa chỉ bộ nhớ (chỉ số của bảng). Do đó, hàm H là một
                                    hàm ánh xạ nhiều – một.
                                </p>
                                <p class="des">Bảng b m có thể x m như ự mở rộng của mảng thông thường.
                                    Việc địa chỉ hóa trực tiếp trong mảng cho phép truy nhập đến phần tử
                                    bất kỳ trong thời gian O(1). Mặc dù, trong tình huống xấu nhất thao
                                    tác tìm kiếm đòi hỏi thời gian O(N) giống như trên danh sách liên kết,
                                    nhưng trên thực tế bảng b m làm việc hiệu quả hơn nhiều. 
                                </p>
                                <h3 class="heading3" id="6.1.2">6.1.2. Quy trình thực hiện lưu trữ trong bảng băm</h3>
                                <p class="des">Quy trình thực hiện lưu trữ trong bảng b m bao gồm các bước sau:</p>
                                
                                <h3 class="heading3" id="6.1.3">6.1.3. Các thao tác trên bảng băm</h3>
                                <p class="des">Các thao tác chính trên bảng b m được xây dựng nhằm h trợ
                                    cho thực hiện các thao tác trên dữ liệu được lưu trữ trong bảng b m.</p>
                                
                                <p class="des">Xét về tính hiệu quả, bảng b m là một phương pháp hiệu quả về
                                    thời gian và vùng nhớ. Việc tìm kiếm một khóa bất kỳ với một lần
                                    truy xuất vùng nhớ bằng cách cho khóa đó địa chỉ của vùng nhớ khi 
                                    không bị giới hạn về vùng nhớ. Cũng tương tự như thế, nếu không bị
                                    giới hạn về thời gian tìm kiếm thì có thể sử dụng một vùng nhớ có
                                    kích thước tối thiểu với phương pháp tìm kiếm tuyến tính.
                                </p>
                                <h2 class="heading2" id="6.2">6.2 HÀM BĂM</h2>
                                <p class="des">Bước đầu tiên trong sử dụng cấu trúc bảng b m là chọn hàm biến
                                    đ i khóa để biến đ i các khóa thành các địa chỉ trong bảng. Hàm ánh
                                    xạ này gọi là hàm b m (hash function).
                                </p>
                                <p class="des">Về mặt t ng quát, một hàm b m tốt là hàm có khả n ng ph n bố đều trên miền giá trị của địa chỉ.</p>
                                <p class="des">Giả sử gọi N là các phần tử được chứa trong bộ nhớ (thường N là
                                    số nguyên tố), hàm b m ẽ biến đ i các khóa (thường là các số
                                    nguyên hoặc là các chu i ký tự ngắn) thành số nguyên trong đoạn
                                    [0..N – 1].
                                </p>
                                <p class="des">Giả sử các khóa là những số nguyên, hàm b m H(k) là:</p>
                                <pre>H(k) = k mod N</pre>
                                <p class="des">với k là khóa và H(k) là hàm lấy số dư của k chia cho N</p>
                                <h2 class="heading2" id="6.3">6.3. CÁC PHƯƠNG PHÁP GIẢI QUYẾT ĐỤNG ĐỘ</h2>
                                <h3 class="heading3" id="6.3.1">6.3.1. Ph ơng ph p nối kết</h3>
                                <h4 class="heading4" id="6.3.1.1">6.3.1.1. Phương pháp nối kết trực tiếp</h4>
                                <p class="des-italic">Ý tưởng phương pháp</p>
                                <p class="des">Có một câu hỏi đặt ra, đó là trong trường hợp các khóa khác nhau
                                    có cùng một địa chỉ trong bảng thì phải lưu trữ như thế nào trong
                                    bảng?. Một cách đơn giản là ứng với m i địa chỉ sẽ có một danh sách
                                    liên kết chứa các phần tử có khóa khác nhau có cùng một địa chỉ. Như
                                    vậy, phải sử dụng một danh sách gồm N phần tử chứa địa chỉ đầu của
                                    danh sách liên kết. Đó là cách thực hiện của phương pháp nối kết trực
                                    tiếp <em>(direct chaining)</em>.</p>
                            
                                <p class="des-italic">Cài đặt bảng băm dùng phương pháp nối kết trực tiếp </p>
                                
                                <p class="des">Nhận xét:</p>
                                <p class="des">Thực chất cấu trúc bảng b m này chỉ tối ưu khi b m đều, nghĩa là
                                    m i danh ách liên kết chứa một vài phần tử bị xung đột, tốc độ truy
                                    xuất lúc này lả O(1). Trường hợp xấu nhất là b m không đều, vì hình
                                    thành một danh ách có N phần tử nên tốc độ truy xuất lúc này là
                                    O(N)
                                </p>
                                <h3 class="heading3" id="6.3.2">6.3.2. Phương pháp địa chỉ mở</h3>
                                <p class="des-italic">Phương pháp giải thuật</p>
                                <p class="des">Phương pháp nối kết trực tiếp có một nhược điểm là phải duy trì
                                    các danh sách liên kết và m i phần tử phải có thêm vùng liên kết địa
                                    chỉ đến phần tử kế tiếp trong danh sách. Có một cách khác để giải
                                    quyết đụng độ là khi có đụng độ xảy ra thì ta sẽ tìm đến vị trí kế tiếp
                                    nào đó ở trong bảng cho đến khi nào tìm thấy phần tử mong muốn
                                    hoặc vị trí kế tiếp là vị trí trống.
                                </p>
                                <p class="des">Trong phương pháp địa chỉ mở (open addressing), tất cả các
                                    phần tử đều được cất giữ vào bảng. Do đó m i ô của bảng hoặc là
                                    chứa khóa hoặc là NULL. tưởng của phương pháp này như au 
                                </p>
                            
                                <p class="des-italic">Cài đặt bảng băm dùng phương pháp địa chỉ mở</p>
                        
                                    <p><strong>BÀI TẬP CHƯƠNG 6</strong></p>
                                    
                            
                        </div>');
                        
INSERT INTO Chapter VALUES ('CHƯƠNG_1', 'TỔNG QUAN', 'CTGT01', NULL);
INSERT INTO Chapter VALUES ('1.1', 'Vai trò của thuật toán và cấu trúc dữ liệu', 'CTGT01', 'CHƯƠNG_1');
INSERT INTO Chapter VALUES ('1.2', 'Thuật toán', 'CTGT01', 'CHƯƠNG_1');
INSERT INTO Chapter VALUES ('1.2.1', 'Định nghĩa thuật toán', 'CTGT01', '1.2');
INSERT INTO Chapter VALUES ('1.2.2', 'Đặc trưng của thuật toán', 'CTGT01', '1.2');
INSERT INTO Chapter VALUES ('1.2.3', 'Biểu diễn thuật toán', 'CTGT01', '1.2');
INSERT INTO Chapter VALUES ('1.2.4', 'Độ phức tạp thuật toán', 'CTGT01', '1.2');
INSERT INTO Chapter VALUES ('1.2.5', 'Các chiến lược thiết kế thuật toán', 'CTGT01', '1.2');
INSERT INTO Chapter VALUES ('1.3', 'Kiểu dữ liệu, Cấu trúc dữ liệu', 'CTGT01', 'CHƯƠNG_1');
INSERT INTO Chapter VALUES ('1.3.1', 'Kiểu dữ liệu', 'CTGT01', '1.3');
INSERT INTO Chapter VALUES ('1.3.2', 'Cấu trúc dữ liệu', 'CTGT01', '1.3');
INSERT INTO Chapter VALUES ('Bài tập chương','', 'CTGT01', 'CHƯƠNG_1');

INSERT INTO Chapter VALUES ('CHƯƠNG_2','SẮP XẾP VÀ TÌM KIẾM','CTGT01', NULL);
INSERT INTO Chapter VALUES ('2.1', 'Mối quan hệ giữa nhu cầu sắp xếp và tìm kiếm dữ liệu', 'CTGT01', 'CHƯƠNG_2');
INSERT INTO Chapter VALUES ('2.2', 'Định nghĩa bài toán sắp xếp', 'CTGT01', 'CHƯƠNG_2');
INSERT INTO Chapter VALUES ('2.3', 'Các giải thuật sắp xếp nội', 'CTGT01', 'CHƯƠNG_2');
INSERT INTO Chapter VALUES ('2.3.1', 'Các giải thuật sắp xếp cơ bản', 'CTGT01', '2.3');
INSERT INTO Chapter VALUES ('2.3.2', 'Giải thuật sắp xếp cây – Heap sort', 'CTGT01', '2.3');
INSERT INTO Chapter VALUES ('2.3.3', 'Giải thuật sắp xếp độ phức tạp giảm dần – Shell sort', 'CTGT01', '2.3');
INSERT INTO Chapter VALUES ('2.3.4', 'Giải thuật sắp xếp dựa trên phân hoạch – Quick sort', 'CTGT01', '2.3');
INSERT INTO Chapter VALUES ('2.3.5', 'Giải thuật sắp xếp trộn trực tiếp – Merge sort', 'CTGT01', '2.3');
INSERT INTO Chapter VALUES ('2.4', 'Định nghĩa bài toán tìm kiếm', 'CTGT01', 'CHƯƠNG_2');
INSERT INTO Chapter VALUES ('2.5', 'Các giải thuật tìm kiếm nội', 'CTGT01', 'CHƯƠNG_2');
INSERT INTO Chapter VALUES ('2.5.1', 'Giải thuật tìm kiếm tuyến tính', 'CTGT01', '2.5');
INSERT INTO Chapter VALUES ('2.5.2', 'Giải thuật tìm kiếm nhị phân', 'CTGT01', '2.5');

-- Insert Chapter 3
INSERT INTO Chapter VALUES ('CHƯƠNG_3', 'DANH SÁCH LIÊN KẾT', 'CTGT01', NULL);
INSERT INTO Chapter VALUES ('3.1', 'Danh sách tuyến tính', 'CTGT01', 'CHƯƠNG_3');
INSERT INTO Chapter VALUES ('3.1.1', 'Định nghĩa', 'CTGT01', '3.1');
INSERT INTO Chapter VALUES ('3.1.2', 'Các thao tác trên danh sách', 'CTGT01', '3.1');
INSERT INTO Chapter VALUES ('3.1.3', 'Biểu diễn danh sách dưới dạng mảng', 'CTGT01', '3.1');
INSERT INTO Chapter VALUES ('3.2', 'Danh sách liên kết', 'CTGT01', 'CHƯƠNG_3');
INSERT INTO Chapter VALUES ('3.2.1', 'Định nghĩa', 'CTGT01', '3.2');
INSERT INTO Chapter VALUES ('3.2.2', 'Danh sách liên kết đơn', 'CTGT01', '3.2');
INSERT INTO Chapter VALUES ('3.2.3', 'Danh sách liên kết kép', 'CTGT01', '3.2');
INSERT INTO Chapter VALUES ('Bài tập chương 3', '', 'CTGT01', 'CHƯƠNG_3');

-- Insert Chapter 4
INSERT INTO Chapter VALUES ('CHƯƠNG_4', 'NGĂN XẾP, HÀNG ĐỢI', 'CTGT01', NULL);
INSERT INTO Chapter VALUES ('4.1', 'Ngăn xếp', 'CTGT01', 'CHƯƠNG_4');
INSERT INTO Chapter VALUES ('4.1.1', 'Định nghĩa', 'CTGT01', '4.1');
INSERT INTO Chapter VALUES ('4.1.2', 'Các thao tác trên ngăn xếp', 'CTGT01', '4.1');
INSERT INTO Chapter VALUES ('4.1.3', 'Ứng dụng với ngăn xếp', 'CTGT01', '4.1');
INSERT INTO Chapter VALUES ('4.1.4', 'Cài đặt ngăn xếp', 'CTGT01', '4.1');
INSERT INTO Chapter VALUES ('4.2', 'Hàng đợi', 'CTGT01', 'CHƯƠNG_4');
INSERT INTO Chapter VALUES ('4.2.1', 'Định nghĩa', 'CTGT01', '4.2');
INSERT INTO Chapter VALUES ('4.2.2', 'Các thao tác trên hàng đợi', 'CTGT01', '4.2');
INSERT INTO Chapter VALUES ('4.2.3', 'Cài đặt hàng đợi', 'CTGT01', '4.2');
INSERT INTO Chapter VALUES ('Bài tập chương 4', '', 'CTGT01', 'CHƯƠNG_4');

-- Insert Chapter 5
INSERT INTO Chapter VALUES ('CHƯƠNG_5', 'CÂY', 'CTGT01', NULL);
INSERT INTO Chapter VALUES ('5.1', 'Định nghĩa và các khái niệm', 'CTGT01', 'CHƯƠNG_5');
INSERT INTO Chapter VALUES ('5.1.1', 'Định nghĩa cây', 'CTGT01', '5.1');
INSERT INTO Chapter VALUES ('5.1.2', 'Các khái niệm', 'CTGT01', '5.1');
INSERT INTO Chapter VALUES ('5.1.3', 'Cây có thứ tự', 'CTGT01', '5.1');
INSERT INTO Chapter VALUES ('5.1.4', 'Duyệt cây theo thứ tự', 'CTGT01', '5.1');
INSERT INTO Chapter VALUES ('5.2', 'Biểu diễn cây trong máy tính', 'CTGT01', 'CHƯƠNG_5');
INSERT INTO Chapter VALUES ('5.2.1', 'Biểu diễn cây sử dụng mảng', 'CTGT01', '5.2');
INSERT INTO Chapter VALUES ('5.2.2', 'Biểu diễn cây sử dụng danh sách liên kết', 'CTGT01', '5.2');
INSERT INTO Chapter VALUES ('5.3', 'Cây nhị phân', 'CTGT01', 'CHƯƠNG_5');
INSERT INTO Chapter VALUES ('5.3.1', 'Định nghĩa và tính chất cây nhị phân', 'CTGT01', '5.3');
INSERT INTO Chapter VALUES ('5.3.2', 'Tính chất của cây nhị phân', 'CTGT01', '5.3');
INSERT INTO Chapter VALUES ('5.3.3', 'Biểu diễn cây nhị phân', 'CTGT01', '5.3');
INSERT INTO Chapter VALUES ('5.3.4', 'Duyệt cây nhị phân', 'CTGT01', '5.3');
INSERT INTO Chapter VALUES ('5.3.5', 'Một số ứng dụng cây nhị phân trong thực tế', 'CTGT01', '5.3');
INSERT INTO Chapter VALUES ('5.4', 'Cây nhị phân tìm kiếm', 'CTGT01', 'CHƯƠNG_5');
INSERT INTO Chapter VALUES ('5.4.1', 'Định nghĩa', 'CTGT01', '5.4');
INSERT INTO Chapter VALUES ('5.4.2', 'Các thao tác trên cây nhị phân tìm kiếm', 'CTGT01', '5.4');
INSERT INTO Chapter VALUES ('5.5', 'Cây cân bằng', 'CTGT01', 'CHƯƠNG_5');
INSERT INTO Chapter VALUES ('5.5.1', 'Định nghĩa', 'CTGT01', '5.5');
INSERT INTO Chapter VALUES ('5.5.2', 'Các trường hợp mất cân bằng', 'CTGT01', '5.5');
INSERT INTO Chapter VALUES ('5.5.3', 'Thêm một phần tử trên cây', 'CTGT01', '5.5');
INSERT INTO Chapter VALUES ('5.5.4', 'Hủy một phần tử trên cây', 'CTGT01', '5.5');
INSERT INTO Chapter VALUES ('Bài tập chương 5', '', 'CTGT01', 'CHƯƠNG_5');

-- Insert Chapter 6
INSERT INTO Chapter VALUES ('CHƯƠNG_6', 'BẢNG BĂM', 'CTGT01', NULL);
INSERT INTO Chapter VALUES ('6.1', 'Bảng băm', 'CTGT01', 'CHƯƠNG_6');
INSERT INTO Chapter VALUES ('6.1.1', 'Định nghĩa', 'CTGT01', '6.1');
INSERT INTO Chapter VALUES ('6.1.2', 'Quy trình thực hiện lưu trữ trong bảng băm', 'CTGT01', '6.1');
INSERT INTO Chapter VALUES ('6.1.3', 'Các thao tác trên bảng băm', 'CTGT01', '6.1');
INSERT INTO Chapter VALUES ('6.2', 'Hàm băm', 'CTGT01', 'CHƯƠNG_6');
INSERT INTO Chapter VALUES ('6.3', 'Các phương pháp giải quyết đụng độ', 'CTGT01', 'CHƯƠNG_6');
INSERT INTO Chapter VALUES ('6.3.1', 'Phương pháp nối kết', 'CTGT01', '6.3');
INSERT INTO Chapter VALUES ('6.3.2', 'Phương pháp địa chỉ mở', 'CTGT01', '6.3');
INSERT INTO Chapter VALUES ('6.3.3', 'Phương pháp nhân', 'CTGT01', '6.3');
INSERT INTO Chapter VALUES ('6.4', 'Hạn chế của bảng băm', 'CTGT01', 'CHƯƠNG_6');
INSERT INTO Chapter VALUES ('Bài tập chương 6', '', 'CTGT01', 'CHƯƠNG_6');