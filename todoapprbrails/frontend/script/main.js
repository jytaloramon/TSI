const server = 'http://127.0.0.1:3000';
const http_req = axios.create({ baseURL: server });

let tasks = [];
let tasks_act = [];
let tasks_fini = [];

const list_task_act = $('#list_task_act');
const list_task_fini = $('#list_task_fini');
const btn_add = $('#btn_add');
let checkbox_task = null
let btn_delete = null

const jq_form = {
    description: $('#inpt_description'),
    date: $('#inpt_date'),
};

lists_org();

btn_add.click(async() => {

    const task = {
        description: jq_form.description.val(),
        date_task: jq_form.date.val()
    }

    if (task.description.length == 0 || task.date_task.length == 0) {
        alert('Preencha os campos!');
        return;
    }

    const resp = await axios.post(`${server}/task/`, task);

    lists_org();
});

async function lists_org() {

    const v = await http_req.get("/task/");
    tasks = v.data

    tasks.sort((a, b) => a.date_task > b.date_task);

    for (const task of tasks)
        task.date_task = task.date_task.slice(0, 10).split('-').reverse().join("/");

    tasks_act = tasks.filter(t => t.is_active);
    tasks_fini = tasks.filter(t => !t.is_active);

    list_task_act.empty();
    list_task_fini.empty()

    let i = 0
    for (const task of tasks_act) {
        s_fist = i == 0 ? 'list-group-item-danger' : '';

        list_task_act.append(`
        <li href="#" class="list-group-item list-group-item-action ${s_fist} flex-column align-items-start">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">${task.date_task}</h5>
                <small>Pendente</small>
            </div>
            <p class="mb-1">${task.description}</p>

            <div class="list-inline">
                <input class="chk_task" id="${task.id}" type="checkbox" aria-label="Checkbox for following text input">
                <div class="justify-content-end">
                    <button  class="btn_delete btn btn-outline-danger btn-sm" id="${task.id}" type="button">Deletar</button>
                </div>
            </div>

        </li>
        `)

        i = 1;
    }

    for (const task of tasks_fini) {
        list_task_act.append(`
        <li href="#" class="list-group-item list-group-item-action list-group-item-primary flex-column align-items-start">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">${task.date_task}</h5>
                <small>Finalizado</small>
            </div>
            <p class="mb-1">${task.description}</p>

            <div class="list-inline">
                <input class="chk_task" id="${task.id}" type="checkbox" aria-label="Checkbox for following text input" checked>
                <div class="justify-content-end">
                    <button  class="btn_delete btn btn-outline-danger btn-sm" id="${task.id}" type="button">Deletar</button>
                </div>
            </div>

        </li>
        `)
    }

    checkbox_task = $('.chk_task');
    btn_delete = $('.btn_delete');

    checkbox_task.change(async(e) => {
        const resp = await axios.patch(`${server}/task/update`, { id: parseInt(e.currentTarget.id) });
        lists_org()
    });

    btn_delete.click(async(e) => {
        const resp = await axios.delete(`${server}/task/destroy`, { data: { id: parseInt(e.currentTarget.id) } });
        lists_org()
    });

}