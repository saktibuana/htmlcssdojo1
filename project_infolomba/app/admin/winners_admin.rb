Trestle.resource(:winners) do
  menu do
    item :winners, icon: "fa fa-star", label:"Pemenang"
  end


  #collection do
  #  model.includes(:contests, :users)
  #end
  # Customize the table columns shown on the index view.
  #
  table do
     column :contest, ->(winner){winner.contest.name} , header: "Lomba"
     column :user,->(winner){winner.user.name} , header: "Pemenang"
     actions
   end

  # Customize the form fields shown on the new/edit views.
  #
   #form do |winner|
    # select :from
     #text_field :user
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
#   end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:winner).permit(:name, ...)
  # end
 
end
