
//Sử dụng
//$("#tPrice").keydown(OnKeyDownCheckNumber);
function OnKeyDownCheckNumber(event) {

    // Cho phép phím xóa về, và phím xóa
    if (event.keyCode != 46 && event.keyCode != 8) {
        //Dừng xử lý khi có phím không phải là số
        if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
            event.preventDefault();
        }
    }
}