Hid hid;   // Hid 객체 생성
HidMsg msg;  // 이벤트가 전달하는 메시지
0 => int device; // 장치 번호
// 키보드에서 신호받기 위해서 Hid 객체를 키보드에 연결
if (! hid.openKeyboard(device)) { // 연결 실패 처리         
    <<< "Can't open this device!! ", "Sorry." >>>;  
    me.exit();
}
// 연결 상태 확인
<<< "keyboard '" + hid.name() + "' ready", "" >>>;

// 키보드 Hid 연결 테스트
Impulse imp => dac;
while (true) {
    hid => now;  // 키 누름 이벤트 발생하기를 기다림
    // 메시지 접수
    while (hid.recv(msg)) {
        // 키 누름 이벤트 처리
        if (msg.isButtonDown()) {
            // 키의 ascii 값 프린트하고,
            <<< "key DOWN:", msg.ascii >>>;
            // 클릭 소리 냄
            5 => imp.next;
        }
        else { // 키 올림 이벤트 처리
            // 아무 것도 하지 않음
        }
    }
}