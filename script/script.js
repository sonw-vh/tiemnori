$("#bars").click(function () {
  $("#bars").toggleClass("bars_active");
}),
  $("#searchBtn").click(function () {
    $(".search").toggleClass("searchBtn");
  }),
  window.addEventListener("scroll", function () {
    $(this).scrollTop() >= 700
      ? $(".go-to-top").fadeIn()
      : $(".go-to-top").fadeOut();
  }),
  $(".go-to-top").click(function () {
    $("html, body").animate({ scrollTop: 0 });
  });
const lazyImages = document.querySelectorAll("[lazy]"),
  lazyImageObserver = new IntersectionObserver((t, e) => {
    t.forEach((t) => {
      if (t.isIntersecting) {
        const s = t.target,
          a = s.dataset.src;
        "img" === s.tagName.toLowerCase()
          ? (s.src = a)
          : (s.style.backgroundImage = "url('" + a + "')"),
          s.removeAttribute("lazy"),
          e.unobserve(s);
      }
    });
  });
lazyImages.forEach((t) => {
  lazyImageObserver.observe(t);
}),
  (address_2 = localStorage.getItem("address_2_saved")) &&
    ($('select[name="calc_shipping_district"] option').each(function () {
      $(this).text() == address_2 && $(this).attr("selected", "");
    }),
    $("input.billing_address_2").attr("value", address_2)),
  (district = localStorage.getItem("district")) &&
    ($('select[name="calc_shipping_district"]').html(district),
    $('select[name="calc_shipping_district"]').on("change", function () {
      var t = $(this).children("option:selected");
      t.attr("selected", ""),
        $('select[name="calc_shipping_district"] option')
          .not(t)
          .removeAttr("selected"),
        (address_2 = t.text()),
        $("input.billing_address_2").attr("value", address_2),
        (district = $('select[name="calc_shipping_district"]').html()),
        localStorage.setItem("district", district),
        localStorage.setItem("address_2_saved", address_2);
    })),
  $('select[name="calc_shipping_provinces"]').each(function () {
    var t = $(this),
      e = "";
    c.forEach(function (s, a) {
      (e += "<option value=" + (a += 1) + ">" + s + "</option>"),
        t.html('<option value="">Tỉnh / Thành phố</option>' + e),
        (address_1 = localStorage.getItem("address_1_saved")) &&
          ($('select[name="calc_shipping_provinces"] option').each(function () {
            $(this).text() == address_1 && $(this).attr("selected", "");
          }),
          $("input.billing_address_1").attr("value", address_1)),
        t.on("change", function (e) {
          e = t.children("option:selected").index() - 1;
          var s = "";
          if ("" != t.val()) {
            arr[e].forEach(function (t) {
              (s += '<option value="' + t + '">' + t + "</option>"),
                $('select[name="calc_shipping_district"]').html(
                  '<option value="">Quận / Huyện</option>' + s
                );
            });
            var a = t.children("option:selected").text(),
              i = $('select[name="calc_shipping_district"]').html();
            localStorage.setItem("address_1_saved", a),
              localStorage.setItem("district", i),
              $('select[name="calc_shipping_district"]').on(
                "change",
                function () {
                  var t = $(this).children("option:selected");
                  t.attr("selected", ""),
                    $('select[name="calc_shipping_district"] option')
                      .not(t)
                      .removeAttr("selected");
                  var e = t.text();
                  $("input.billing_address_2").attr("value", e),
                    (i = $('select[name="calc_shipping_district"]').html()),
                    localStorage.setItem("district", i),
                    localStorage.setItem("address_2_saved", e);
                }
              );
          } else $('select[name="calc_shipping_district"]').html('<option value="">Quận / Huyện</option>'), (i = $('select[name="calc_shipping_district"]').html()), localStorage.setItem("district", i), localStorage.removeItem("address_1_saved", a);
        });
    });
  });
