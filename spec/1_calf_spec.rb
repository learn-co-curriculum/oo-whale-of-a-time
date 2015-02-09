describe "Calf" do

  it "is initialized with a mother" do
    mom = Whale.new("Cassandra")
    expect { Calf.new(mom) }.to_not raise_error
  end

  context "instance of Calf" do

    let(:mom) { Whale.new("Cassandra") }
    let(:calf) { Calf.new(mom) }

    context "#mother" do

      it "knows who its mother is" do
        expect(calf.mother).to eq(mom)
      end

      it "can change its mother when adopted" do
        adoptive_mom = Whale.new("Phoebe")
        calf.mother = adoptive_mom
        expect(calf.mother).to_not eq(mom)
        expect(calf.mother).to eq(adoptive_mom)
      end

    end

    context "#lbs_of_milk" do

      it "is initialized with a lbs_of_milk of 0" do
        expect(calf.lbs_of_milk).to eq(0)
      end

      it "can eat" do
        expect(calf.lbs_of_milk).to eq(0)
        calf.lbs_of_milk = 100
        expect(calf.lbs_of_milk).to eq(100)
      end
    end

    context "#hungry?" do

      it "knows it's hungry when lbs_of_milk is less than 100" do
        expect(calf.hungry?).to eq(true)
        calf.lbs_of_milk = 100
        expect(calf.hungry?).to eq(false)
      end

    end

    context "#drink_milk" do

      it "drinks if it's hungry and its mother has more than 50 lbs of milk" do
        calf.mother.lbs_of_milk = 75
        calf.lbs_of_milk = 0
        expect(calf.drink_milk).to eq("nom nom nom...")
        expect(mom.lbs_of_milk).to eq(25)
        expect(calf.lbs_of_milk).to eq(50)
      end

      it "doesn't drink if it's full" do
        calf.mother.lbs_of_milk = 75
        calf.lbs_of_milk = 101
        expect(calf.drink_milk).to eq("No way I'm stuffed!")
        expect(mom.lbs_of_milk).to eq(75)
        expect(calf.lbs_of_milk).to eq(101)
      end

      it "doesn't drink if its mom has less than 50 lbs of milk" do
        calf.mother.lbs_of_milk = 0
        calf.lbs_of_milk = 30
        expect(calf.drink_milk).to eq("wish I could")
        expect(mom.lbs_of_milk).to eq(0)
        expect(calf.lbs_of_milk).to eq(30)
      end

    end

  end

end
