Trestle.resource(:contestants) do
  menu do
    item :contestants, icon: "fa fa-calendar" , label: "Daftar Peserta Lomba", priority: :first
  end

  # Customize the table columns shown on the index view.
  #
   table do
     column :contest,->(contestant){ contestant.contest.name}, header: "Nama Lomba"
     column :user,->(contestant){contestant.user.name}, header: "Nama Peserta"
     actions
   end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |contestant|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:contestant).permit(:name, ...)
  # end
end
