import SwiftUI

struct ContentView: View {
    
    @State private var tasks: [Task] = [
        Task(id: UUID(), title: "Fazer", description: "Fazer o Upload dos produtos da Uniedeucação", date: Date()),
        Task(id: UUID(), title: "Comprar", description: "Comprar materiais de escritório", date: Date()),
        Task(id: UUID(), title: "Reunião", description: "Participar da reunião de equipe", date: Date())
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Olá, mundo!")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination:	 ListaTaskView(tasks: $tasks)) {
                    Text("Ir para tela 2!")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Tela Principal")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
