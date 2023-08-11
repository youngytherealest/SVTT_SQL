/*
 * Author: Abdullah A Almsaeed
 * Date: 4 Jan 2014
 * Description:
 *      This is a demo file used only for the main dashboard (index.html)
 **/

/* global moment:false, Chart:false, Sparkline:false */

$(function () {
  "use strict";

  // Make the dashboard widgets sortable Using jquery UI
  $(".connectedSortable").sortable({
    placeholder: "sort-highlight",
    connectWith: ".connectedSortable",
    handle: ".card-header, .nav-tabs",
    forcePlaceholderSize: true,
    zIndex: 999999,
  });
  $(".connectedSortable .card-header").css("cursor", "move");

  // bootstrap WYSIHTML5 - text editor
  $(".textarea").summernote();

  $(".daterange").daterangepicker(
    {
      ranges: {
        Today: [moment(), moment()],
        Yesterday: [moment().subtract(1, "days"), moment().subtract(1, "days")],
        "Last 7 Days": [moment().subtract(6, "days"), moment()],
        "Last 30 Days": [moment().subtract(29, "days"), moment()],
        "This Month": [moment().startOf("month"), moment().endOf("month")],
        "Last Month": [
          moment().subtract(1, "month").startOf("month"),
          moment().subtract(1, "month").endOf("month"),
        ],
      },
      startDate: moment().subtract(29, "days"),
      endDate: moment(),
    },
    function (start, end) {
      // eslint-disable-next-line no-alert
      alert(
        "You chose: " +
          start.format("MMMM D, YYYY") +
          " - " +
          end.format("MMMM D, YYYY")
      );
    }
  );

  /* jQueryKnob */
  $(".knob").knob();

  // jvectormap data
  var visitorsData = {
    US: 398, // USA
    SA: 400, // Saudi Arabia
    CA: 1000, // Canada
    DE: 500, // Germany
    FR: 760, // France
    CN: 300, // China
    AU: 700, // Australia
    BR: 600, // Brazil
    IN: 800, // India
    GB: 320, // Great Britain
    RU: 3000, // Russia
  };
  // --------------------------------------------------------------------------------------------------------------
  /* Chart.js Charts */
  $.ajax({
    type: "GET",
    url: "get_so_luong_sinh_vien_theo_truong",
    success: function (response) {
      // Donut chart for major
      let truong = [];
      let soluong = [];

      $.each(response, function (idx, val) {
        truong.push(val["truong"]);
        soluong.push(val["soluong"]);
      });

      var collegeChart = document
        .getElementById("college-chart-canvas")
        .getContext("2d");
      var myCollegeChart = new Chart(collegeChart, {
        type: "bar",
        data: {
          labels: truong,
          datasets: [
            {
              data: soluong,
              borderWidth: 1,
              backgroundColor: [
                "rgba(255, 99, 132, 0.8)",
                "rgba(255, 159, 64, 0.8)",
                "rgba(255, 205, 86, 0.8)",
                "rgba(75, 192, 192, 0.8)",
                "rgba(54, 162, 235, 0.8)",
                "rgba(153, 102, 255, 0.8)",
                "rgba(201, 203, 207, 0.8)",
              ],
            },
          ],
          hoverOffset: 1,
        },
        options: {
          responsive: true,
          plugins: {
            legend: false,
          },
          scales: {
            y: {
              beginAtZero: true,
            },
          },
        },
      });
    },
  });

  $.ajax({
    type: "GET",
    url: "get_so_luong_sinh_vien_theo_nganh",
    success: function (response) {
      // Donut chart for major
      let nganh = [];
      let soluong = [];

      $.each(response, function (idx, val) {
        nganh.push(val["nganh"]);
        soluong.push(val["soluong"]);
      });
      var majorChart = document.getElementById("world_map").getContext("2d");
      var myMajorChart = new Chart(majorChart, {
        type: "pie",
        data: {
          labels: nganh,
          datasets: [
            {
              data: soluong,
              borderWidth: 1,
              backgroundColor: [
                "rgba(255, 99, 132, 0.8)",
                "rgba(255, 159, 64, 0.8)",
                "rgba(255, 205, 86, 0.8)",
                "rgba(75, 192, 192, 0.8)",
                "rgba(54, 162, 235, 0.8)",
                "rgba(153, 102, 255, 0.8)",
                "rgba(201, 203, 207, 0.8)",
              ],
            },
          ],
          hoverOffset: 4,
        },
        options: {
          responsive: true,
          cutoutPercentage: 70, // Độ lớn của lỗ trống ở giữa (giữa các vòng)
          plugins: {
            legend: {
              position: "bottom",
            },
          },
        },
      });
    },
  });

  $("#dashboard_bangdssv").DataTable({
    paging: true,
    lengthChange: false,
    searching: true,
    ordering: true,
    info: true,
    autoWidth: false,
    responsive: true,
    ajax: {
      type: "GET",
      url: "get_all_sinh_vien",
      dataSrc: "",
    },
    columns: [
      { data: "mssv" },
      { data: "hoten" },
      { data: "gioitinh" },
      { data: "nganh" },
      { data: "truong" },
      {
        data: "id",
        render: function (data, type, row) {
          return (
            '<a href="thongtinsinhvien?id=' +
            data +
            '" class="btn btn-sm" id="editBtn" style="color: green; text-align: center; "><i class="fa-solid fa-eye"></i></a>'
          );
        },
      },
    ],
  });
});
