module ApplicationHelper
    def link_to_add_fields(name, phone_form, association)
        new_object = phone_form.object.send(association).klass.new
        id = new_object.object_id
        fields = phone_form.fields_for(association, new_object, child_index: id) do |builder|

            render(association.to_s.singularize + "_fields", phone_form: builder)
        end

        link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})

    end
end
