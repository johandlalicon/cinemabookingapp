module ApplicationHelper
    def button_style
        "flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
    end

    def label_class
        "block text-sm font-medium leading-6 text-gray-900"
    end
    def input_class
        "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
    end
    def form_button_class
        "flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
    end
    def table_style
        "border border-gray-300 px-4 py-2"
    end

    # def display_validation_errors(model, attribute)
    # if model.errors.any?
    #   errors = model.errors.full_messages_for(attribute).join(', ')
    #   content_tag(:div, errors, class: 'text-red-500')
    # end
    # end
end
