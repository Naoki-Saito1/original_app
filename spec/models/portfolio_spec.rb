require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  describe '' do
    context '' do
      it '' do
        task = Task.new(task_name: '', content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
end
