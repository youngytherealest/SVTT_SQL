$.ajax({
  type: "GET",
  url: "get_user_info_by_username?username=" + localStorage.getItem("username"),
  success: function (res) {
    $("#dashboard_user_fullname").text(res.hoten);
    $("#dashboard_avatar_url").prop("src", res.avatar);
    $("#dashboard_user_fullname").prop(
      "href",
      "hosonguoihuongdan?id=" + localStorage.getItem("username")
    );
  },
});

function active_nav_link() {
  let current = window.location.href.split("/").slice(-1)[0];
  let elements = document.querySelectorAll(".nav-link");

  elements.forEach(function (el) {
    var element = el.getAttribute("id");
    if (element && element.includes(current) && current !== "") {
      el.classList.add("active");
      var id = element.split("_")[0];
      document.getElementById(id).classList.add("active");
    } else if (element && element.includes(current) && current == "") {
      document.getElementById("dashboard_home").classList.add("active");
    }
  });
}

active_nav_link();
