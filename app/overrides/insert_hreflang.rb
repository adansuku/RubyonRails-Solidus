Deface::Override.new(virtual_path: 'spree/shared/_head',
					 name: 'insert_hreflang',
					 insert_after: "erb[loud]:contains('canonical_tag(current_store.url)')",
					 text: "\n<%= hreflang %>",
					 original: '0748090511ebad881f3e6cd0444687eb7bc8c5e6')