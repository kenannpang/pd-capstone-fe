import SwiftUI

struct ContentView: View {
    @State var order_count : Int = 2
    let charges = Array([
        "Subtotal":"$25.60",
        "Delivery fee":"$3.00",
        "Platform fee":"$0.40"
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
                            .background(Color.pink)
                            .cornerRadius(8)
                    }
                }
                .padding()
                
                ScrollView(.vertical) {
                    //order component, repeats a Horizontal container with qty, img, listing title, description, and price
                    VStack {
                        ForEach(1...order_count, id: \.self) { _ in
                            HStack {
                                Text("Qty: 1").font(.headline)
                                Spacer()
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width/5)
                                    .cornerRadius(8)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Listing Title")
                                        .font(.headline)
                                        .padding(.horizontal)
                                    Text("Listing Description")
                                        .font(.subheadline)
                                        .padding(.horizontal)
                                }
                                Spacer()
                                Text("$10.00")
                            }
                        }
                        
                    }
                    .padding()
                    Button(action:{
                        self.order_count += 1
                    }) {
                        Text("Increase order: \(order_count)")
                    }
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.pink)
                    .cornerRadius(8)
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 8)
                        .padding(.vertical)
                    
                    
                    VStack {
                        VStack{
                            HStack {
                                Text("Popular with your order")
                                    .font(.headline)
                                Spacer()
                            }
                            HStack {
                                Text("Other customers also bought these")
                                    .font(.subheadline)
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal) {
                            HStack{
                                ForEach(1...10, id: \.self) { _ in
                                    VStack {
                                        Spacer()
                                        Image(systemName: "photo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: .infinity)
                                            .cornerRadius(8)
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Listing Title")
                                                .font(.headline)
                                                .padding(.horizontal)
                                            Text("Listing Description")
                                                .font(.subheadline)
                                                .padding(.horizontal)
                                        }
                                        Spacer()
                                        Text("$10.00")
                                        
                                        Spacer()
                                        NavigationLink("Learn More", destination: CustomisationPage())
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 4)
                                            .background(Color.pink)
                                            .cornerRadius(8)
                                            .frame(maxWidth: .infinity)
                                        
                                        Spacer(minLength: 4)
                                    }
                                }

                                .padding(.vertical, 4)
                                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width / 2.5)
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                                .padding(.horizontal,4)
                            }
                            .padding(.horizontal)
                        }
// Pink Banner
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
//                        .background(Color.pink)
                        
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
                        .fill(.gray)
                        .frame(height: 8)
                    HStack {
                        Text("Total")
                            .font(.headline)
                            .padding()
                        Spacer()
                        Text("S$ 26.00")
                            .font(.headline)
                            .padding()
                    }
                    NavigationLink(
                        destination: DoneView(),
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
                                .background(Color.pink)
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
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    
                    // Customisation options
                    VStack {
                        HStack {
                            Text("Title").font(.headline)
                            Spacer()
                            Text("S$ 16.80")
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
                                    .background(Color.gray)
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
                        .background(Color.pink)
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
                                    .background(Color.gray)
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
                        .background(Color.pink)
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
                    destination: ContentView(),
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
                            .background(Color.pink)
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

struct DoneView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Your Order").font(.headline)
                    Spacer()
                    Text("Help")
                        .font(.headline)
                        .foregroundColor(.pink)
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
                            Text("#xnnp-r6pt").padding(4).background(Color.gray).cornerRadius(8)
                        }
                    }
                    .padding()
                }
                
            }
        }
    }
}

struct StratchView: View {
    @State private var showGreeting = true
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Stratch View").font(.headline)
                    Spacer()
                    Text("For dev to play around")
                        .font(.headline)
                        .foregroundColor(.pink)
                }
                .padding()
                
                
                
                ScrollView(.vertical) {
                    VStack() {
                        Text("Start scratch")
                        VStack {
                                    Toggle("Show welcome message", isOn: $showGreeting)

                                    if showGreeting {
                                        Text("Hello World!")
                                    }
                                }
                        Text("End scratch")
                    }
                    .padding()
                }
                
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        CustomisationPage()
        DoneView()
        StratchView()
    }
}
