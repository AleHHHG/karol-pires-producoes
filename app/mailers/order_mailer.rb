class OrderMailer < ApplicationMailer

  def budget_request
    @order = params[:order]
    mail(to: @order.supplier.email, subject: "Orçamento: #{@order.project.name} - #{@order.goal}")
  end
end
