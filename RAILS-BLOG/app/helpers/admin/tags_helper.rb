module Admin::TagsHelper
	def create_deletable_button tag
		if tag.in_use?
			link_to '#' do
				content_tag(:button, 'Delete', class: 'disabled') #we've used ruby code instead of html. For instance:- <button type="button" class="disabled">Delete</button>
			end
		else
			link_to admin_tag_path(tag), method: :delete do
				content_tag(:button, 'Delete')
			end
		end
	end
end
