import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import listPlugin from "@fullcalendar/list";

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
  var calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, listPlugin],　//listPluginを追加
    initialView: 'dayGridMonth',
    locale: "jp", //日本語対応
    events: '/events',
    //レスポンシブ処理
    windowResize: function () {
        if (window.innerWidth < 991.98) {
            calendar.changeView('listMonth');
        } else {
            calendar.changeView('dayGridMonth');
        }
    },
    
    dateClick: function(info){
            //日付をクリックしたときのイベント(詳しくは次回の記事へ)
    },
    eventClick: function(info){
            //表示されたイベントをクリックしたときのイベント(詳しくは次回の記事へ)
    },
    
  });

  calendar.render();
});