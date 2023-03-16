import SwiftUI

struct ContentView: View {
    @State var order_count : Int = 1
    let charges = Array([
        "Subtotal":"$ 12.60",
        "Delivery fee":"$ 3.00",
        "Platform fee":"$ 0.40"
       ].enumerated().map { $0 })
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search", text: .constant(""))
                        .padding(8)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.cerisered)
                            .cornerRadius(8)
                    }
                }
                .padding()
                
                ScrollView(.vertical) {
                    Image("fp-cart-page-rider")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    //order component, repeats a Horizontal container with qty, img, listing title, description, and price
                    VStack {
                        ForEach(1...order_count, id: \.self) { _ in
                            HStack {
                                Text("Qty: 1").font(.headline)
                                Spacer()
                                Image("fp-food-kfc-2pcs")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width/5)
                                    .cornerRadius(8)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("2 pcs Chicken Meal")
                                        .font(.headline)
                                        .padding(.horizontal)
                                    Text("2 pcs Chicken, 3 pcs Nugget, 1 side and 1 drink")
                                        .font(.subheadline)
                                        .padding(.horizontal)
                                        .foregroundColor(.dustygray)
                                        
                                }
                                Spacer()
                                Text("$ 12.60")
                            }
                        }
                        
                    }
                    .padding()
// Increment button, to manually increase the number of orders in order component (hidden until required)
//                    Button(action:{
//                        self.order_count += 1
//                    }) {
//                        Text("Increase order: \(order_count)")
//                    }
//                    .foregroundColor(.white)
//                    .padding(8)
//                    .background(Color.cerisered)
//                    .cornerRadius(8)
                    Rectangle()
                        .fill(Color.silver)
                        .frame(height: 1)
                        .padding(.vertical)
                    
                    
                    VStack {
                        VStack{
                            HStack {
                                Text("Bubble Tea? Bubble Tea...")
                                    .font(.headline)
                                Spacer()
                            }
                            HStack {
                                Text("(Beta) Complete your meal, no additional delivery charge")
                                    .font(.subheadline)
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal) {
                            HStack{
                                ForEach(1...3, id: \.self) { _ in
                                    VStack {
                                        Spacer()
                                        Image("fp-drink-gong-cha-pearl-milk-tea")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: .infinity)
                                            .cornerRadius(8)
                                        HStack {
                                            Text("$5.30")
                                                .font(.headline)
                                            NavigationLink("+", destination: CustomisationPage2())
                                                .font(.title2)
                                                .foregroundColor(.white)
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 3)
                                                .background(Color.cerisered)
                                                .cornerRadius(80)
                                                .frame(maxWidth: .infinity)
                                                .font(.subheadline)
                                        }
                                        HStack {
                                            Text("Pearl Milk Tea")
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                        
                                        
                                        Spacer()
                                        
                                        
                                        Spacer(minLength: 4)
                                    }
                                }

                                .padding(.vertical, 4)
                                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width / 1.25)
                                .cornerRadius(8)
                                .padding(.horizontal,4)
                            }
                            .padding(.horizontal)
                            
                            HStack{
                                ForEach(1...3, id: \.self) { _ in
                                    
                                }

                                .padding(.vertical, 4)
                                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width / 2.5)
                                .cornerRadius(8)
                                .padding(.horizontal,4)
                            }
                            .padding(.horizontal)
                        }
// cerisered Banner (hidden until required)
//                        HStack {
//                            VStack {
//                                Text("Hello")
//                                    .font(.headline)
//                                Text("Hello")
//                                    .font(.subheadline)
//                                    .foregroundColor(.white)
//                            }
//                            .padding()
//
//                            Spacer()
//
//                            VStack {
//                                Image(systemName: "photo")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width / 2.5)
//                                    .cornerRadius(8)
//                            }
//                            .padding()
//                        }
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2.5)
//                        .background(Color.cerisered)
                        
                        VStack {
                            ForEach(charges, id: \.element.key) { c in
                                HStack {
                                    Text("\(c.element.key)")
                                    Spacer()
                                    Text("\(c.element.value)")
                                }
                            }
                        }
                        .padding()
                    }
                }
                VStack {
                    Rectangle()
                        .fill(Color.silver)
                        .frame(height: 1)
                    HStack {
                        Text("Total")
                            .font(.headline)
                            .padding()
                        Spacer()
                        Text("$ 16.00")
                            .font(.headline)
                            .padding()
                    }
                    NavigationLink(
                        destination: DeliveryPage(),
                        label: {
                            Text("Make Payment")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal)
                                .padding(.horizontal)
                                .padding(.horizontal)
                                .padding(.horizontal)
                                .padding(.horizontal)
                                .padding(.horizontal)
                                .background(Color.cerisered)
                                .cornerRadius(8)
                                
                        })
                }
            }
        }
    }
}

//content view 2 added for mock up prep. hard coded navigation when ordered pearl milk tea
struct ContentView2: View {
    @State var order_count : Int = 1
    let charges = Array([
        "Subtotal":"$ 17.90",
        "Delivery fee":"$ 3.00",
        "Platform fee":"$ 0.40"
       ].enumerated().map { $0 })
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search", text: .constant(""))
                        .padding(8)
                        .background(Color(.systemGray5))
                        .cornerRadius(8)
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.cerisered)
                            .cornerRadius(8)
                    }
                }
                .padding()
                
                ScrollView(.vertical) {
                    Image("fp-cart-page-rider")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    //order component, repeats a Horizontal container with qty, img, listing title, description, and price
                    VStack {
                        HStack {
                            Text("Qty: 1").font(.headline)
                            Spacer()
                            Image("fp-food-kfc-2pcs")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width/5)
                                .cornerRadius(8)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("2 pcs Chicken Meal")
                                    .font(.headline)
                                    .padding(.horizontal)
                                Text("2 pcs Chicken, 3 pcs Nugget, 1 side and 1 drink")
                                    .font(.subheadline)
                                    .padding(.horizontal)
                                    .foregroundColor(.dustygray)
                            }
                            Spacer()
                            Text("$ 12.60")
                        }
                        HStack {
                            Text("Qty: 1").font(.headline)
                            Spacer()
                            Image("fp-drink-gong-cha-pearl-milk-tea")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width/5)
                                .cornerRadius(8)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Pearl Milk Tea")
                                    .font(.headline)
                                    .padding(.horizontal)
                                Text("Delicious boba with milk tea")
                                    .font(.subheadline)
                                    .padding(.horizontal)
                                    .foregroundColor(.dustygray)
                            }
                            Spacer()
                            Text("$ 5.30")
                        }
                    }
                    .padding()
// Increment button, to manually increase the number of orders in order component (hidden until required)
//                    Button(action:{
//                        self.order_count += 1
//                    }) {
//                        Text("Increase order: \(order_count)")
//                    }
//                    .foregroundColor(.white)
//                    .padding(8)
//                    .background(Color.cerisered)
//                    .cornerRadius(8)
                    Rectangle()
                        .fill(Color.silver)
                        .frame(height: 1)
                        .padding(.vertical)
                    
                    
                    VStack {
                        VStack{
                            HStack{
                                ForEach(1...3, id: \.self) { _ in
                                }
                                .padding(.vertical, 4)
                                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width / 2.5)
                                .cornerRadius(8)
                                .padding(.horizontal,4)
                            }
                            .padding(.horizontal)
                        }
// cerisered Banner (hidden until required)
//                        HStack {
//                            VStack {
//                                Text("Hello")
//                                    .font(.headline)
//                                Text("Hello")
//                                    .font(.subheadline)
//                                    .foregroundColor(.white)
//                            }
//                            .padding()
//
//                            Spacer()
//
//                            VStack {
//                                Image(systemName: "photo")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width / 2.5)
//                                    .cornerRadius(8)
//                            }
//                            .padding()
//                        }
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2.5)
//                        .background(Color.cerisered)
                        
                        VStack {
                            ForEach(charges, id: \.element.key) { c in
                                HStack {
                                    Text("\(c.element.key)")
                                    Spacer()
                                    Text("\(c.element.value)")
                                }
                            }
                        }
                        .padding()
                    }
                }
                VStack {
                    Rectangle()
                        .fill(Color.silver)
                        .frame(height: 1)
                    HStack {
                        Text("Total")
                            .font(.headline)
                            .padding()
                        Spacer()
                        Text("$ 21.30")
                            .font(.headline)
                            .padding()
                    }
                    NavigationLink(
                        destination: DeliveryPage(),
                        label: {
                            Text("Make Payment")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal)
                                .padding(.horizontal)
                                .padding(.horizontal)
                                .padding(.horizontal)
                                .padding(.horizontal)
                                .padding(.horizontal)
                                .background(Color.cerisered)
                                .cornerRadius(8)
                                
                        })
                }
            }
        }
    }
}

struct CustomisationPage: View {
    let customisation_sugar_level = Array([
        "Less sweet":"Free",
        "More sweet":"Free",
       ].enumerated().map { $0 })
    let customisation_ice = Array([
        "Less ice":"+ $0.70",
        "More ice":"Free",
       ].enumerated().map { $0 })
    @State private var hasPudding = true
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // Listing picture
                    Image("fp-drink-gong-cha-pearl-milk-tea")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                    // Customisation options
                    VStack {
                        HStack {
                            Text("Pearl Milk Tea").font(.title)
                            Spacer()
                            Text("$ 5.30").font(.headline)
                        }
                        HStack {
                            Text("Delicious boba with milk tea").font(.subheadline)
                            Spacer()
                        }
                        //c1. customisation 1: calls customisation_sugar_level
                        VStack {
                            HStack {
                                Text("Sugar Level").font(.headline)
                                Spacer()
                                Text("Required")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.silver)
                                    .cornerRadius(8)
                            }
                            .padding()
                            HStack {
                                Text("Select 1").font(.subheadline)
                                Spacer()
                            }
                            .padding()
                            ForEach(customisation_sugar_level, id: \.element.key) { c in
                                HStack {
                                    Text("\(c.element.key)").padding(.horizontal)
                                    Spacer()
                                    Text("\(c.element.value)").padding(.horizontal)
                                    
                                }
                            }
                        }
                        .background(Color.fantasy)
                        .cornerRadius(8)
                        
                        // c2 start. customisation 2: calls customisation_ice
                        VStack {
                            HStack {
                                Text("Ice Amount").font(.headline)
                                Spacer()
                                Text("Required")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.silver)
                                    .cornerRadius(8)
                            }
                            .padding()
                            HStack {
                                Text("Select 1").font(.subheadline)
                                Spacer()
                            }
                            .padding()
                            ForEach(customisation_ice, id: \.element.key) { c in
                                HStack {
                                    Text("\(c.element.key)").padding(.horizontal)
                                    Spacer()
                                    Text("\(c.element.value)").padding(.horizontal)
                                }
                            }
                        }
                        .background(Color.fantasy)
                        .cornerRadius(8)
                        
                        //c3. customisation 3: add pudding
                        VStack {
                                    Toggle("Pudding?", isOn: $hasPudding)

                                    if hasPudding {
                                        Text("Pudding!")
                                        Text("+ $0.90")
                                    }
                                }
                    }.padding()
                    
                    Spacer()
                    
                }
            }
            VStack {
                NavigationLink(
// Originally navigates to cart page. This is temporarily navigating to hard coded cart page with bubble tea. (hidden until required)
//                    destination: ContentView(),
                    destination: ContentView2(),
                    label: {
                        Text("Add to cart")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .background(Color.cerisered)
                            .cornerRadius(8)
                            
                    })
            }
        }
        
    }
}

//Customisationpage2 is a hard coded, temporal page for our mock up presentation (remove after presentation)
struct CustomisationPage2: View {
    let customisation_sugar_level = Array([
        "Less sweet":"Free",
        "More sweet":"Free",
       ].enumerated().map { $0 })
    let customisation_ice = Array([
        "Less ice":"+ $0.70",
        "More ice":"Free",
       ].enumerated().map { $0 })
    @State private var hasPudding = true
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // Listing picture
                    Image("fp-drink-gong-cha-pearl-milk-tea")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                    // Customisation options
                    VStack {
                        HStack {
                            Text("Pearl Milk Tea").font(.title)
                            Spacer()
                            Text("$ 5.30").font(.headline)
                        }
                        HStack {
                            Text("Delicious boba with milk tea").font(.subheadline)
                            Spacer()
                        }
                        ZStack {
                            Image("fp-customisation-page-hard-coded")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                //.frame(width: UIScreen.main.bounds.width/5)
                                .cornerRadius(8)
                            Image("fp-coming-soon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                //.frame(width: UIScreen.main.bounds.width/5)
                                .cornerRadius(8)
                        }
                    }
                }
            }
            VStack {
                NavigationLink(
// Originally navigates to cart page. This is temporarily navigating to hard coded cart page with bubble tea. (hidden until required)
//                    destination: ContentView(),
                    destination: ContentView2(),
                    label: {
                        Text("Add to cart")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .padding(.horizontal)
                            .background(Color.cerisered)
                            .cornerRadius(8)
                            
                    })
            }
        }
        
    }
}


struct RadioButton: View {
    @Binding var isSelected: Bool
    var title: String
    var price: String?

    var body: some View {
        HStack {
            Toggle("", isOn: $isSelected)
            Text(title)
            Spacer()
            if let price = price {
                Text(price)
            }
        }
    }
}

struct DeliveryPage: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Your Order").font(.headline)
                    Spacer()
                    Text("Help")
                        .font(.headline)
                        .foregroundColor(.cerisered)
                }
                .padding()
                
                
                
                ScrollView(.vertical) {
                    VStack() {
                        HStack {
                            Text("Order Details").font(.title)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Order number").font(.subheadline)
                            Spacer()
                            Text("#xnnp-r6pt").padding(4).background(Color.silver).cornerRadius(8)
                        }
                    }
                    .padding()
                }
                
            }
        }
    }
}

struct StratchView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Stratch View").font(.headline)
                    Spacer()
                    Text("For dev to play around")
                        .font(.headline)
                        .foregroundColor(.cerisered)
                }
                .padding()
                
                
                
                ScrollView(.vertical) {
                    VStack() {
                        Text("Start scratch")
                        NavigationLink("+", destination: CustomisationPage2())
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 3)
                            .background(Color.cerisered)
                            .cornerRadius(80)
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                        
                        Image("fp-cart-page-rider")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        VStack {
                            //can I create a number bubble?
                            Text("1")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(Color.cerisered)
                                .cornerRadius(80)
                                .frame(maxWidth: .infinity)
                                .font(.subheadline)
                            //can I put words under that bubble?
                            
                            //can I layer a number bubble on a rectangle?
                            ZStack {
                                VStack {
                                    Rectangle()
                                        .fill(Color.cerisered)
                                        .frame(height: 6)
                                }
                                VStack {
                                    Text("1")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 8)
                                        .background(Color.cerisered)
                                        .cornerRadius(80)
                                        .frame(maxWidth: .infinity)
                                        .font(.subheadline)
                                    Text("Menu")
                                        .font(.subheadline)
                                        .foregroundColor(Color.dustygray)
                                }
                            }
                            
                            VStack {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 400, height: 6)
                                        .foregroundColor(.cerisered)
                                    
                                    Circle()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.cerisered)
                                        .overlay(
                                            Text("1")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        )
                                }
                                
                                Text("one")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                            //can I do that 3 times?
                            VStack {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 400, height: 6)
                                        .foregroundColor(.cerisered)
                                    
                                    HStack(spacing: 100) {
                                        CircleView(number: "1", label: "one")
                                        CircleView(number: "2", label: "two")
                                        CircleView(number: "3", label: "three")
                                    }
                                }
                            }
                            //boom. component.
                            //can I make some gray in colour?
                            Spacer()
                            ProgressBar(currentStep: 1)
                            ProgressBar(currentStep: 2)
                            ProgressBar(currentStep: 3)
                        }
                        
                        Text("End scratch")
                        Image("fp-delivery-page-donate-a-meal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        //can I create a rectangle with text, and give it a shadow?
                        Text("Swift is awesome")
                            .background(
                                Rectangle()
                                    .fill(Color.white)
                                    .shadow(
                                        color: Color.gray.opacity(0.5),
                                        radius: 8,
                                        x: 4,
                                        y: 4
                                    )
                            )
                        
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 250, height: 100)
                            .foregroundColor(Color.white)
                            .shadow(color: .silver.opacity(0.7), radius: 3, x: 2, y: 2)
                        
                        //can I give it a shadow?
                        
                    }
                    .padding()
                }
                
            }
        }
    }
}

struct CircleView: View {
    let number: String
    let label: String
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 32, height: 32)
                .foregroundColor(.cerisered)
                .overlay(
                    Text(number)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                )
            
            Text(label)
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
        .offset(y: 10)
    }
}

struct ProgressBar: View {
    let currentStep: Int

    var body: some View {
        ZStack {
            // Draw a gray rectangle as the background of the progress bar
            Rectangle()
                .frame(width: 400, height: 6)
                .foregroundColor(.gray)
            
            HStack(spacing: 0) {
                // For each of the 3 steps, draw a circle and a connecting rectangle
                ForEach(1...3, id: \.self) { step in
                    Circle()
                        .frame(width: 32, height: 32)
                        // Set the circle color to pink if the step is less than or equal to the current step, gray otherwise
                        .foregroundColor(step <= currentStep ? .cerisered : .gray)
                        .overlay(
                            Text("\(step)")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        )
                    
                    if step < 3 {
                        Rectangle()
                            .frame(width: 144, height: 6)
                            // Set the rectangle color to pink if the step is less than the current step, gray otherwise
                            .foregroundColor(step < currentStep ? .cerisered : .gray)
                    }
                }
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView2()
        CustomisationPage()
        CustomisationPage2()
        DeliveryPage()
        StratchView()
    }
}
