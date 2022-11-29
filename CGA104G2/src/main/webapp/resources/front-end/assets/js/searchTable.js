(function(document) {
    'use strict';

    // 建立 TableFilter
    let TableFilter = (function(Arr) {

        let in_put;

        // 資料輸入事件處理函數
        function _onInputEvent(e) {
            in_put = e.target;
            let tables = document.getElementsByClassName(in_put.getAttribute('data-table'));
            Arr.forEach.call(tables, function(table) {
                Arr.forEach.call(table.tBodies, function(tbody) {
                    Arr.forEach.call(tbody.rows, _filter);
                });
            });
        }

        // 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
        function _filter(row) {
            let text = row.textContent.toLowerCase(), val = in_put.value.toLowerCase();
            row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
        }

        return {
            // 初始化函數
            init: function() {
                let inputs = document.getElementsByClassName('table-filter');
                Arr.forEach.call(inputs, function(input) {
                    input.oninput = _onInputEvent;
                });
            }
        };
    })(Array.prototype);

    // 網頁載入完成後，啟動 TableFilter
    document.addEventListener('readystatechange', function() {
        if (document.readyState === 'complete') {
            TableFilter.init();
        }
    });
})(document);