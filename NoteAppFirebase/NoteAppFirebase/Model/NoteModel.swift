//
//  NoteModel.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Foundation

struct NoteModel: Codable, Identifiable {
    var id: String
    var title: String
    var description: String
    var timestamp: Double

    var asDict: [String: Any] {
        return [
            "id": id,
            "title": title,
            "description": description,
            "timestamp": timestamp
        ]
    }
}

extension NoteModel {
    static var MOCK_NOTE = [
        NoteModel(id: UUID().uuidString, title: "NGƯỜI MIỀN NÚI DỖI", description: "Trong buổi livestream tối qua, Double2T thú nhận với Độ Mixi rằng: Trước đây em từng trong nhóm Độ Tộc của anh, xong từ khi em không đậu casting Moi Rap là em out luôn.", timestamp: Double.random(in: 1693500000 ..< 1693600000)),
        NoteModel(id: UUID().uuidString, title: "TUYỂN SINH LỚP DẠY THÊM TIẾNG ANH TẠI NHÀ CHO HỌC SINH TIỂU HỌC", description: "Đến với lớp của mình các em sẽ được học theo giáo trình quốc tế được xuất bản bởi Đại học Oxford. Giáo trình được thiết kế đặc biệt với các hoạt động và tài liệu phù hợp với lứa tuổi và sự phát triển của trẻ.", timestamp: Double.random(in: 1693500000 ..< 1693600000)),
        NoteModel(id: UUID().uuidString, title: "FWD Việt Nam", description: "FWD Việt Nam tự hào tiên phong mang đến trải nghiệm bảo hiểm dễ hiểu để khách hàng biết rõ quyền lợi của mình một cách dễ dàng. ", timestamp: Double.random(in: 1693500000 ..< 1693600000)),
        NoteModel(id: UUID().uuidString, title: "Tôi là một người rất đơn giản, dễ hiểu...", description: "Không là có, có là không, mà không cũng là không, có cũng là có, nhiều khi nói có nhưng thật ra là không có nhưng thật ra là có @@", timestamp: Double.random(in: 1693500000 ..< 1693600000)),
        NoteModel(id: UUID().uuidString, title: "Flutter Viet Nam", description: "Em publish app lên apple store ok rồi. Ngôn ngữ chính cũng là Việt Nam. Nhưng khi mở app store để download nó báo là không có app ở quốc gia việt nam. A nào có k.n cái này chỉ giúp em với ak.", timestamp: Double.random(in: 1693500000 ..< 1693600000)),
        NoteModel(id: UUID().uuidString, title: "CHÚT QUÀ KỶ NIỆM NGÀY MÌNH YÊU NHAU", description: "Một tình yêu đẹp nằm ở cách ta trân trọng mối tình ấy ra sao ", timestamp: Double.random(in: 1693500000 ..< 1693600000)),
        NoteModel(id: UUID().uuidString, title: "VỊT HOÁ THIÊN NGA", description: "Chiếc xe cẩu Tứ quý 9 sau nhiều năm bôn ba, đến ngay gần hết niên hạn thì kịp kí ngay một thương vụ chuyển nhượng. Sau ngày bắt đầu định danh biển số, chủ mới đã  em nó thành Ford Raptor mới bóng loáng...", timestamp: Double.random(in: 1693500000 ..< 1693600000))
    ]
}
