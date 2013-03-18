class SwitchReleaseButton
  constructor: (options) ->
    @id = options.id || ""
    @published = options.published || false

do ($ = jQuery) ->
  $.fn.switchReleaseButton = (options) ->
    settings =
      debug: false

    settings = $.extend settings, options

    log = (msg) ->
      console?.log msg if settings.debug

    return @each(() ->
      options ||= {}

      tr_parent = $(this).closest("tr")
      @unrelease_btn = $(this).children(":first")
      @release_btn = $(this).children(":last")

      options.id = tr_parent.data("id")
      if tr_parent.data("published") == ""
        options.published = true
        @unrelease_btn.css("display", "inline")
      else
        @release_btn.css("display", "inline")

      $(this).data('switch_release_button', (data = new SwitchReleaseButton(options)))

      log "Creating switchReleaseButton for " + data.id + ", published : " + data.published

      $(this).children().click =>
        action = if data.published then "unrelease" else "release"
        $.post("/albums/" + data.id + "/" + action, {},
          =>
            log action + " " + data.id
            if data.published
              @unrelease_btn.hide(100, () =>
                @release_btn.show(100)
              )
            else
              @release_btn.hide(100, () =>
                @unrelease_btn.show(100)
              )
            data.published = !data.published
        )
    )
