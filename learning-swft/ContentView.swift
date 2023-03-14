import SwiftUI

//14mar - make the look for swimlane bubble tea. Reconvene 3pm
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
                    VStack {
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
                            .padding()
                        }
                        // Add a pink container with text "Hello!"
                        // and 5 lines of text below it
                        // using VStack and Text views
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
                                    Text("Random text \(index)")
                                    Spacer()
                                    Text("Random text \(index)")
                                }
                                
                            }
                        }
                        .padding()
                        
                        // Add a pink "Done" button at the bottom of the page
                        // that navigates to a view called "Done"
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
                //.padding(.top)
            }
        }
        //.navigationTitle("Page 1")
    }
}

struct CustomisationPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                // Listing picture
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Listing title
                Text("listing.title")
                    .font(.title)
                    .fontWeight(.bold)
                
                // Listing description
                Text("listing.description")
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                Spacer() // add a spacer here to push the customisation blocks down
                
                // Customisation options
                VStack(alignment: .leading, spacing: 10) {
                    // Customisation title
                    Text("Colour")
                        .font(.title)
                        .fontWeight(.bold)
                    //RadioButton(isSelected: false, title: "Hi mom")
                }
            }
        }
    }
}

//This view does nothing.lol.
struct DoneView: View {
    var body: some View {
        VStack() {
            Text("Hello world")
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        CustomisationPage()
        DoneView()
    }
}
