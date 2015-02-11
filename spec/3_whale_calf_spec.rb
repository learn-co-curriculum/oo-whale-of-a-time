
describe "Interactions" do

  context "Whale" do

    let(:ellie) { Whale.new("Ellie") }

    describe "#give_birth" do

      it "makes a new instance of the calf class, passing itself as the mother" do
        expect(Calf).to receive(:new).with(ellie)
        ellie.give_birth
      end

      it "adds the new calf to the calves array" do
        original_num_of_calves = ellie.calves.length
        ellie.give_birth
        expect(ellie.calves.length).to eq(original_num_of_calves + 1)
        expect(ellie.calves.last.mother).to eq(ellie)
      end

    end

    describe "#adopt_calf" do

      let(:phoebe) {Whale.new("Phoebe") }
      let(:orphan) {Calf.new(phoebe) }

      it "accepts one argument, an instance of the calf class" do
        expect { ellie.adopt_calf(orphan) }.to_not raise_error
      end

      it "adds the calf to the calves array" do
        original_num_of_calves = ellie.calves.length
        ellie.adopt_calf(orphan)
        expect(ellie.calves.length).to eq(original_num_of_calves + 1)
        expect(ellie.calves.last).to eq(orphan)
      end

      it "lets the orphan calf know who its new mother is" do
        ellie.adopt_calf(orphan)
        expect(orphan.mother).to eq(ellie)
      end

    end

    describe "#feed_calf" do

      let(:calf) { Calf.new(ellie) }

      it "accepts one argument, an instance of a calf" do
        ellie.adopt_calf(calf)
        expect { ellie.feed_calf(calf) }.to_not raise_error
      end

      it "feeds the calf if the calf is hungry and it(self) has more than 50 lbs of milk" do
        calf.lbs_of_milk = 0
        ellie.lbs_of_milk = 75
        ellie.adopt_calf(calf)
        ellie.feed_calf(calf)
        expect(ellie.lbs_of_milk).to eq(25)
        expect(calf.lbs_of_milk).to eq(50)
      end

      it "doesn't feed calf if calf is full" do
        calf.lbs_of_milk = 120
        ellie.lbs_of_milk = 75
        ellie.adopt_calf(calf)
        expect(ellie.feed_calf(calf)).to eq("calf isn't hungry")
        expect(ellie.lbs_of_milk).to eq(75)
        expect(calf.lbs_of_milk).to eq(120)
      end

      it "doesn't feed calf if it(self) doesn't have enough milk (50)  " do
        calf.lbs_of_milk = 0
        ellie.lbs_of_milk = 5
        ellie.adopt_calf(calf)
        expect(ellie.feed_calf(calf)).to eq("not enough milk")
        expect(ellie.lbs_of_milk).to eq(5)
        expect(calf.lbs_of_milk).to eq(0)
      end

    end

  end

  context "Calf" do

    let(:mom) { Whale.new("Ellie") }
    let(:calf) { Calf.new(mom) }

    describe "#drink_milk" do

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
