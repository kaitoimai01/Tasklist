require 'rails_helper'

RSpec.describe Task, type: :model do
    before do
        @task = create(:task)
    end

    describe 'Validation' do
        it 'title, content カラムのどちらにも値が設定されていれば問題なし' do
            expect(@task.valid?).to eq(true)
        end

        it 'titleが空だとNG' do
            @task.title = ''
            expect(@task.valid?).to eq(false)
        end

        it 'contentが空だとNG' do
            @task.content = ''
            expect(@task.valid?).to eq(false)
        end
    end
end