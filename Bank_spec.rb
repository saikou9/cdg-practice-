require 'rspec'

require_relative 'Bank'

describe 'Main' do
    main = Main.new

  it 'cheking how the deposit works and the main function of init' do
    balance = 100
    allow_any_instance_of(Kernel).to receive(:gets).and_return('d', '100', 'q')
    expect(main.init(balance)).to be 3
  end

  it 'a function that checks the type of a value ' do
    balance = 909
    expect(main.check(balance)).to be true
    balance = 'string type'
    expect(main.check(balance)).to be false
  end

  it 'this function checks that the value is greater than zero' do
    balance = 1000
    expect(main.more_then_zero(balance)).to be true
    balance = 0
    expect(main.more_then_zero(balance)).to be false
  end

  it 'checking withdrawal' do
    balance = 100
    withr = 10
    expect(main.withdrawal(balance, withr)). to eq 90
    balance = 100
    withr = 1000
    allow_any_instance_of(Kernel).to receive(:gets).and_return('w', '1000', 'q')
    expect(main.init(balance)).to be 3
  end

end