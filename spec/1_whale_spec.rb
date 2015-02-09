describe "Whale" do

  it "is initialized with a name" do
    expect { Whale.new("Ellie") }.to_not raise_error
  end

  context "#instance of whale" do

    let(:ellie) { Whale.new("Ellie") }

    describe "#name" do

      it "knows its name" do
        expect(ellie.name).to eq("Ellie")
      end

      it "cannot change its name" do
        expect { ellie.name = "Phoebe" }.to raise_error
      end

    end

    describe "#calves" do

      it "is initialized with an empty 'calves' array" do
        expect(ellie.calves.class).to eq(Array)
        expect(ellie.calves.length).to eq(0)
      end

      it "can be changed" do
        expect { ellie.calves << Calf.new(ellie) }.to_not raise_error
        calf = Calf.new(ellie) 
        ellie.calves << calf
        expect(ellie.calves).to include(calf)
      end

    end

    describe "#lbs_of_milk" do

      it "is initialized at 120" do
        expect(ellie.lbs_of_milk).to eq(120)
      end

      it "can be changed" do
        expect { (ellie.lbs_of_milk = 200) }.to_not raise_error
        ellie.lbs_of_milk = 200
        expect(ellie.lbs_of_milk).to eq(200)
      end

    end

    describe "#lbs_of_krill" do

      it "is initialized at 0" do
        expect(ellie.lbs_of_krill).to eq(0)
      end

      it "can be changed" do
        expect { (ellie.lbs_of_krill = 400) }.to_not raise_error
        ellie.lbs_of_krill = 400
        expect(ellie.lbs_of_krill).to eq(400)
      end

    end

    describe "#hungry?" do

      it "returns true if lbs_of_krill is less than 2,000, else false" do
        expect(ellie.hungry?).to eq(true)
        ellie.lbs_of_krill = 2000
        expect(ellie.hungry?).to eq(false)
      end

    end

  end

end