Deface::Override.new(virtual_path:'spree/admin/translations/_form_fields',
					 name: 'fix_bug_flags_locale',
					 remove: "erb[silent]:contains('locale.to_s.include?')",
                     closing_selector: "erb[silent]:contains('end')")

Deface::Override.new(virtual_path:'spree/admin/translations/_form_fields',
					 name: 'insert_flags_locale',
					 insert_bottom: "div.pull-right.text-muted",
                     text: "<%= image_tag(flag_image_url(locale)) %>")