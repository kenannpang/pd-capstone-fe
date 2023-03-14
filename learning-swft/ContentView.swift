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
                        HStack{
                            ForEach(1...10, id: \.self) { _ in
                                VStack {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(8)
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Listing Title")
                                            .font(.headline)
                                        Text("Listing Description")
                                            .font(.subheadline)
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
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .frame(height: 200)
                            .background(Color(.systemGray5))
                            .cornerRadius(8)
                            .padding(.horizontal)
                        }
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
struct funnypage: View {
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
        funnypage()
    }
}
