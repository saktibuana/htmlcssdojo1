Trestle.resource(:contests) do
  menu do
    item :contests, icon: "fas fa-running", label:"List Lomba"
  end

  # Customize the table columns shown on the index view.
  #
   table do
     
     column :name, header: "Lomba"
     column :description, header: "Deskripsi"
     column :maxcontestant, header: "Maksimal Peserta"
     column :status
     actions
   end

  # Customize the form fields shown on the new/edit views.
  #
   form do |contest|
     text_field :name, label: "Nama"
     text_field :description, label:"Diskripsi"
     number_field :maxcontestant, label: "Max kontestan"
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
   end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:contest).permit(:name, ...)
  # end
end
