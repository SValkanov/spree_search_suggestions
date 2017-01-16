Deface::Override.new(virtual_path: 'spree/shared/_search',
  name: 'add_search_suggestions_js_to_field',
  insert_before: "erb[loud]:contains('search_field_tag :keywords')",
  text: '
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script>
    jQuery(function() {
      var container, input, search;
      search = $("#keywords");
      $(search).autocomplete({
        source: "/search_suggestions",
        appendTo: container,
        position: {
          of: search
        },
        select: function(event, data) {
          event.preventDefault();
          if (event.which === 1) {
            search.val(data.item.value);
          }
        }
      });
    });
    </script>
  ')
