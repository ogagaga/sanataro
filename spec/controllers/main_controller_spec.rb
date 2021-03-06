# -*- coding: utf-8 -*-
require 'spec_helper'

describe MainController do
  fixtures :users, :items, :accounts, :credit_relations, :monthly_profit_losses

  describe "#show_parent_child_item" do
    context "before login," do
      before do
        xhr :get, :show_parent_child_item, :id => 1, :type => 'child'
      end

      it_should_behave_like "Unauthenticated Access by xhr"
    end

    context "after login," do
      before do
        login
      end
      context "without id," do
        before do
          xhr :get, :show_parent_child_item, :type => 'child'
        end

        it_should_behave_like "Unauthenticated Access by xhr"
      end

      context "with id which doesn't exist," do
        before do
          xhr :get, :show_parent_child_item, :type => 'child', :id => 10000
        end

        it_should_behave_like "Unauthenticated Access by xhr"
      end

      context "with id which is valid," do
        before do
          create_entry(:action_date => '2008/2/10', 
                       :item_name=>'テスト10show_parent_child', 
                       :amount=>'10,000', :from=>accounts(:credit4).id,
                       :to=>accounts(:outgo3).id, :year => 2008, :month => 2)

          @item = Item.find_by_name_and_parent_id('テスト10show_parent_child', nil)
          xhr :get, :show_parent_child_item, :id => @item.id, :type => 'child'
        end

        describe "response" do
          subject { response }
          it { should redirect_by_js_to entries_url(:year => 2008, :month => 4) + "#item_#{@item.child_item.id}" }
        end
      end

      context "with :type => 'parent' even it should not be done," do
        before do
          create_entry(:action_date => '2008/2/10',
                       :item_name=>'テスト10show_parent_child', 
                       :amount=>'10,000', :from=>accounts(:credit4).id,
                       :to=>accounts(:outgo3).id, :year => 2008, :month => 2)

          @item = Item.find_by_name_and_parent_id('テスト10show_parent_child',nil)
          xhr :get, :show_parent_child_item, :id => @item.id, :type => 'parent'
        end

        it_should_behave_like "Unauthenticated Access by xhr"
      end
    end
  end
end
