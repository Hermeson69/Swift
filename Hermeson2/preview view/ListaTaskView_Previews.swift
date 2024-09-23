import SwiftUI

struct ListaTaskView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample tasks array
        let tasks = [
            Task(id: UUID(), title: "Fazer", description: "Fazer o Upload dos produtos da Uniedeucação", date: Date()),
            Task(id: UUID(), title: "Comprar", description: "Comprar materiais de escritório", date: Date()),
            Task(id: UUID(), title: "Reunião", description: "Participar da reunião de equipe", date: Date())
        ]
        
        // Create a Binding to the tasks array
        ListaTaskView(tasks: .constant(tasks))
    }
}
