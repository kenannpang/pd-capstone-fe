import SwiftUI

struct ContentView: View {
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
                        ForEach(1...2, id: \.self) { _ in
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
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 8)
                    
                    
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
                        
                        HStack {
                            VStack {
                                Text("Hello")
                                    .font(.headline)
                                Text("Hello")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            
                            Spacer()
                            
                            VStack {
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width / 2.5)
                                    .cornerRadius(8)
                            }
                            .padding()
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2.5)
                        .background(Color.pink)
                        
                        VStack {
                            ForEach(1...5, id: \.self) { index in
                                HStack {
                                    Text("#Fee \(index)")
                                    Spacer()
                                    Text("S$ <Price_\(index)>")
                                }
                                .padding()
                            }
                        }
                        .padding()
                        
                        
                        NavigationLink(
                            destination: DoneView(),
                            label: {
                                Text("Done")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.pink)
                                    .cornerRadius(8)
                            })
                            .padding()
                    }
                }
            }
        }
    }
}

struct CustomisationPage: View {
    var body: some View {
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
                    
                    //this is repeatable options
                    VStack {
                        HStack {
                            Text("Chocie of Main [Dilmah Mix and Match Bundle]").font(.headline)
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
                        HStack {
                            Text("o <Option_1>")
                            Spacer()
                            Text("<Price_1>")
                        }.padding()
                        HStack {
                            Text("o <Option_2>")
                            Spacer()
                            Text("<Price_2>")
                        }.padding()
                        HStack {
                            Text("o <Option_3>")
                            Spacer()
                            Text("<Price_3>")
                        }.padding()
                    }
                    .background(Color.pink)
                    .cornerRadius(8)
                    
                    
                }.padding()
                
                Spacer()
                NavigationLink(
                    destination: ContentView(),
                    label: {
                        Text("Add to Cart")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.pink)
                            .cornerRadius(8)
                    })
                    .padding()
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
                
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        CustomisationPage()
        DoneView()
    }
}
