<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bharatpur Hospital · EMR</title>
    <link rel="stylesheet" href="../css/output.css">
    <style>
        /* A4 sheet sizing */
        #a4Sheet {
            width: 210mm;
            min-height: 297mm;
            padding: 18mm 16mm;
        }
        @media print {
            body * { visibility: hidden; }
            #a4Sheet, #a4Sheet * { visibility: visible; }
            #a4Sheet {
                position: absolute;
                top: 0;
                left: 0;
                width: 210mm;
                min-height: 297mm;
                margin: 0;
                box-shadow: none;
                border: none;
            }
            #printOverlay { position: static; background: none; padding: 0; }
            .no-print { display: none !important; }
        }
    </style>
</head>
<body class="bg-slate-50 text-slate-800 antialiased">

<!-- Top bar -->
<div class="border-b border-slate-200 bg-white no-print">
    <div class="max-w-3xl mx-auto px-6 py-4 flex items-center justify-between">
        <div class="flex items-center gap-3">
            <div class="w-8 h-8 rounded-md bg-blue-600 flex items-center justify-center text-white text-sm font-semibold">B</div>
            <div>
                <h1 class="text-sm font-semibold text-slate-900 leading-tight">Bharatpur Hospital</h1>
                <p class="text-xs text-slate-400 leading-tight">Electronic Medical Record</p>
            </div>
        </div>
        <div class="text-right text-xs text-slate-500">
            <p>Visit No. <span class="text-slate-900 font-medium" id="visitNoDisplay"><%= request.getAttribute("visitNumber") == null ? "—" : request.getAttribute("visitNumber") %></span></p>
            <p id="visitDateDisplay"><%= new java.text.SimpleDateFormat("dd MMM yyyy").format(new java.util.Date()) %></p>
        </div>
    </div>
</div>

<form id="emrForm" action="saveRecord.jsp" method="post" class="max-w-3xl mx-auto px-6 py-8 space-y-6 no-print">

    <!-- Patient -->
    <section>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
                <label class="block text-xs font-medium text-slate-500 mb-1.5">Patient name</label>
                <input type="text" name="patientName" id="patientName" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
            </div>
            <div>
                <label class="block text-xs font-medium text-slate-500 mb-1.5">Contact number</label>
                <input type="tel" name="contactNumber" id="contactNumber" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
            </div>
            <div class="sm:col-span-2">
                <label class="block text-xs font-medium text-slate-500 mb-1.5">Symptoms</label>
                <textarea name="symptoms" id="symptoms" rows="2" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500"></textarea>
            </div>
        </div>
    </section>

    <!-- 01 Reception -->
    <section class="bg-white rounded-lg border border-slate-200 p-5">
        <div class="flex items-center gap-2 mb-4">
            <span class="text-xs font-semibold text-blue-600 tabular-nums">01</span>
            <h2 class="text-sm font-semibold text-slate-900">Reception</h2>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
                <label class="block text-xs font-medium text-slate-500 mb-1.5">Department</label>
                <select name="department" id="department" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
                    <option value="">Select department</option>
                    <option>General Medicine</option>
                    <option>Pediatrics</option>
                    <option>Orthopedics</option>
                    <option>Gynecology</option>
                    <option>ENT</option>
                </select>
            </div>
            <div>
                <label class="block text-xs font-medium text-slate-500 mb-1.5">Doctor</label>
                <input type="text" name="doctor" id="doctor" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
            </div>
            <div>
                <label class="block text-xs font-medium text-slate-500 mb-1.5">Estimated waiting time</label>
                <input type="text" name="waitTime" id="waitTime" placeholder="e.g. 15 min" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
            </div>
            <div class="flex items-end">
          <span class="inline-flex items-center gap-1.5 rounded-md bg-green-50 text-green-700 text-xs font-medium px-2.5 py-1.5 border border-green-100">
            <span class="w-1.5 h-1.5 rounded-full bg-green-500"></span> Consultation paid
          </span>
            </div>
        </div>
    </section>

    <!-- 02 Diagnosis -->
    <section class="bg-white rounded-lg border border-slate-200 p-5">
        <div class="flex items-center gap-2 mb-4">
            <span class="text-xs font-semibold text-blue-600 tabular-nums">02</span>
            <h2 class="text-sm font-semibold text-slate-900">Doctor Consultation · Diagnosis</h2>
        </div>
        <textarea name="diagnosis" id="diagnosis" rows="3" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500"></textarea>
    </section>

    <!-- 03 Lab tests -->
    <section class="bg-white rounded-lg border border-slate-200 p-5">
        <div class="flex items-center justify-between mb-4">
            <div class="flex items-center gap-2">
                <span class="text-xs font-semibold text-blue-600 tabular-nums">03</span>
                <h2 class="text-sm font-semibold text-slate-900">Laboratory Tests</h2>
            </div>
            <span class="inline-flex items-center gap-1.5 rounded-md bg-amber-50 text-amber-700 text-xs font-medium px-2.5 py-1.5 border border-amber-100">
          <span class="w-1.5 h-1.5 rounded-full bg-amber-500"></span> Payment pending
        </span>
        </div>

        <label class="block text-xs font-medium text-slate-500 mb-1.5">Requested tests</label>
        <div id="labTests" class="space-y-2 mb-2">
            <input type="text" name="labTest[]" placeholder="Test name" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
        </div>
        <button type="button" onclick="addRow('labTests','labTest[]','Test name')" class="text-xs font-medium text-blue-600 hover:text-blue-700">+ Add test</button>

        <div class="mt-4 pt-4 border-t border-slate-100">
            <label class="block text-xs font-medium text-slate-500 mb-1.5">Results</label>
            <textarea name="labResults" id="labResults" rows="2" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500"></textarea>
        </div>
    </section>

    <!-- 04 Prescription -->
    <section class="bg-white rounded-lg border border-slate-200 p-5">
        <div class="flex items-center gap-2 mb-4">
            <span class="text-xs font-semibold text-blue-600 tabular-nums">04</span>
            <h2 class="text-sm font-semibold text-slate-900">Prescription</h2>
        </div>

        <div class="grid grid-cols-3 gap-2 mb-1.5">
            <span class="text-xs font-medium text-slate-500">Medicine</span>
            <span class="text-xs font-medium text-slate-500">Dose</span>
            <span class="text-xs font-medium text-slate-500">Days</span>
        </div>
        <div id="rxRows" class="space-y-2">
            <div class="grid grid-cols-3 gap-2">
                <input type="text" name="rxMedicine[]" class="rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
                <input type="text" name="rxDose[]" class="rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
                <input type="number" name="rxDays[]" class="rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
            </div>
        </div>
        <button type="button" onclick="addRxRow()" class="mt-2 text-xs font-medium text-blue-600 hover:text-blue-700">+ Add medicine</button>
    </section>

    <!-- 05 Pharmacy -->
    <section class="bg-white rounded-lg border border-slate-200 p-5">
        <div class="flex items-center gap-2 mb-4">
            <span class="text-xs font-semibold text-blue-600 tabular-nums">05</span>
            <h2 class="text-sm font-semibold text-slate-900">Pharmacy</h2>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
            <div>
                <label class="block text-xs font-medium text-slate-500 mb-1.5">Total medicine cost</label>
                <input type="number" name="medicineCost" id="medicineCost" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
            </div>
            <div>
                <label class="block text-xs font-medium text-slate-500 mb-1.5">Payment status</label>
                <select name="medicinePaymentStatus" id="medicinePaymentStatus" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
                    <option>Pending</option>
                    <option>Paid</option>
                </select>
            </div>
            <div>
                <label class="block text-xs font-medium text-slate-500 mb-1.5">Dispensed</label>
                <select name="dispensed" id="dispensed" class="w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
                    <option>No</option>
                    <option>Yes</option>
                </select>
            </div>
        </div>
    </section>

    <!-- Actions -->
    <div class="flex justify-end gap-3 pt-2">
        <button type="reset" class="px-4 py-2 text-sm font-medium text-slate-500 hover:text-slate-700">Reset</button>
        <button type="button" onclick="showSummary()" class="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-md hover:bg-blue-700">Save record</button>
    </div>
</form>

<!-- Print / preview overlay -->
<div id="printOverlay" class="hidden fixed inset-0 bg-slate-900/60 z-50 overflow-y-auto py-10">
    <div class="max-w-fit mx-auto">

        <!-- Toolbar -->
        <div class="no-print flex justify-end gap-2 mb-4 max-w-[210mm] mx-auto">
            <button onclick="closeSummary()" class="px-4 py-2 text-sm font-medium text-slate-700 bg-white rounded-md border border-slate-300 hover:bg-slate-50">Close</button>
            <button onclick="window.print()" class="px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-md hover:bg-blue-700">Print</button>
        </div>

        <!-- A4 sheet -->
        <div id="a4Sheet" class="bg-white shadow-xl mx-auto text-slate-900" style="font-size: 12px;">

            <!-- Letterhead -->
            <div class="flex items-center justify-between border-b-2 border-blue-600 pb-4 mb-6">
                <div class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-md bg-blue-600 flex items-center justify-center text-white text-base font-semibold">B</div>
                    <div>
                        <h1 class="text-base font-bold text-slate-900 leading-tight">Bharatpur Hospital</h1>
                        <p class="text-xs text-slate-500 leading-tight">Electronic Medical Record — Visit Summary</p>
                    </div>
                </div>
                <div class="text-right text-xs text-slate-500">
                    <p>Visit No. <span id="s_visitNo" class="font-semibold text-slate-900">—</span></p>
                    <p id="s_date" class="mt-0.5"></p>
                </div>
            </div>

            <!-- Patient -->
            <div class="grid grid-cols-3 gap-4 mb-5 text-sm">
                <div><span class="block text-xs text-slate-500">Patient name</span><span id="s_patientName" class="font-medium">—</span></div>
                <div><span class="block text-xs text-slate-500">Contact number</span><span id="s_contactNumber" class="font-medium">—</span></div>
                <div class="col-span-3"><span class="block text-xs text-slate-500">Symptoms</span><span id="s_symptoms" class="font-medium">—</span></div>
            </div>

            <!-- Reception -->
            <div class="mb-5">
                <h2 class="text-xs font-bold uppercase tracking-wide text-blue-700 border-b border-slate-200 pb-1 mb-2">01 · Reception</h2>
                <div class="grid grid-cols-3 gap-4 text-sm">
                    <div><span class="block text-xs text-slate-500">Department</span><span id="s_department" class="font-medium">—</span></div>
                    <div><span class="block text-xs text-slate-500">Doctor</span><span id="s_doctor" class="font-medium">—</span></div>
                    <div><span class="block text-xs text-slate-500">Est. waiting time</span><span id="s_waitTime" class="font-medium">—</span></div>
                </div>
                <p class="mt-2 inline-block text-xs font-medium text-green-700">✓ Consultation payment: Paid</p>
            </div>

            <!-- Diagnosis -->
            <div class="mb-5">
                <h2 class="text-xs font-bold uppercase tracking-wide text-blue-700 border-b border-slate-200 pb-1 mb-2">02 · Diagnosis</h2>
                <p id="s_diagnosis" class="text-sm whitespace-pre-wrap">—</p>
            </div>

            <!-- Lab tests -->
            <div class="mb-5">
                <h2 class="text-xs font-bold uppercase tracking-wide text-blue-700 border-b border-slate-200 pb-1 mb-2">03 · Laboratory Tests</h2>
                <div class="text-sm mb-2">
                    <span class="block text-xs text-slate-500 mb-1">Requested tests</span>
                    <ul id="s_labTests" class="list-disc list-inside space-y-0.5"></ul>
                </div>
                <div class="text-sm">
                    <span class="block text-xs text-slate-500">Results</span>
                    <span id="s_labResults" class="font-medium">—</span>
                </div>
                <p class="mt-2 text-xs font-medium text-amber-700">● Laboratory payment: Pending</p>
            </div>

            <!-- Prescription -->
            <div class="mb-5">
                <h2 class="text-xs font-bold uppercase tracking-wide text-blue-700 border-b border-slate-200 pb-1 mb-2">04 · Prescription</h2>
                <table class="w-full text-sm border-collapse">
                    <thead>
                    <tr class="text-xs text-slate-500 text-left">
                        <th class="border-b border-slate-200 py-1 font-medium">Medicine</th>
                        <th class="border-b border-slate-200 py-1 font-medium">Dose</th>
                        <th class="border-b border-slate-200 py-1 font-medium">Days</th>
                    </tr>
                    </thead>
                    <tbody id="s_rxTable"></tbody>
                </table>
            </div>

            <!-- Pharmacy -->
            <div class="mb-8">
                <h2 class="text-xs font-bold uppercase tracking-wide text-blue-700 border-b border-slate-200 pb-1 mb-2">05 · Pharmacy</h2>
                <div class="grid grid-cols-3 gap-4 text-sm">
                    <div><span class="block text-xs text-slate-500">Total medicine cost</span><span id="s_medicineCost" class="font-medium">—</span></div>
                    <div><span class="block text-xs text-slate-500">Payment status</span><span id="s_medicinePaymentStatus" class="font-medium">—</span></div>
                    <div><span class="block text-xs text-slate-500">Dispensed</span><span id="s_dispensed" class="font-medium">—</span></div>
                </div>
            </div>

            <!-- Signatures -->
            <div class="grid grid-cols-2 gap-8 mt-16 text-sm">
                <div class="border-t border-slate-400 pt-1 text-xs text-slate-500">Doctor's signature</div>
                <div class="border-t border-slate-400 pt-1 text-xs text-slate-500">Pharmacist's signature</div>
            </div>

            <p class="mt-10 text-[10px] text-slate-400 text-center">This is a system-generated record from Bharatpur Hospital EMR.</p>
        </div>
    </div>
</div>

<script>
    function addRow(containerId, name, placeholder) {
        const c = document.getElementById(containerId);
        const input = document.createElement('input');
        input.type = 'text';
        input.name = name;
        input.placeholder = placeholder;
        input.className = 'w-full rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500';
        c.appendChild(input);
    }

    function addRxRow() {
        const c = document.getElementById('rxRows');
        const row = document.createElement('div');
        row.className = 'grid grid-cols-3 gap-2';
        row.innerHTML = `
        <input type="text" name="rxMedicine[]" class="rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
        <input type="text" name="rxDose[]" class="rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
        <input type="number" name="rxDays[]" class="rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-100 focus:border-blue-500">
      `;
        c.appendChild(row);
    }

    function val(id) {
        const el = document.getElementById(id);
        if (!el) return '';
        return el.value ? el.value.trim() : '';
    }

    function fill(id, text, fallback) {
        document.getElementById(id).textContent = (text && text.length) ? text : (fallback || '—');
    }

    function showSummary() {
        // Header
        fill('s_visitNo', document.getElementById('visitNoDisplay').textContent);
        document.getElementById('s_date').textContent = document.getElementById('visitDateDisplay').textContent;

        // Patient
        fill('s_patientName', val('patientName'));
        fill('s_contactNumber', val('contactNumber'));
        fill('s_symptoms', val('symptoms'));

        // Reception
        fill('s_department', val('department'));
        fill('s_doctor', val('doctor'));
        fill('s_waitTime', val('waitTime'));

        // Diagnosis
        fill('s_diagnosis', val('diagnosis'));

        // Lab tests
        const labTestInputs = document.querySelectorAll('input[name="labTest[]"]');
        const labList = document.getElementById('s_labTests');
        labList.innerHTML = '';
        let hasTest = false;
        labTestInputs.forEach(inp => {
            if (inp.value.trim()) {
                hasTest = true;
                const li = document.createElement('li');
                li.textContent = inp.value.trim();
                labList.appendChild(li);
            }
        });
        if (!hasTest) {
            const li = document.createElement('li');
            li.textContent = 'No tests requested';
            li.className = 'text-slate-400 list-none -ml-5';
            labList.appendChild(li);
        }
        fill('s_labResults', val('labResults'));

        // Prescription
        const meds = document.querySelectorAll('input[name="rxMedicine[]"]');
        const doses = document.querySelectorAll('input[name="rxDose[]"]');
        const days = document.querySelectorAll('input[name="rxDays[]"]');
        const rxTable = document.getElementById('s_rxTable');
        rxTable.innerHTML = '';
        let hasRx = false;
        meds.forEach((m, i) => {
            if (m.value.trim()) {
                hasRx = true;
                const tr = document.createElement('tr');
                tr.innerHTML = `
            <td class="border-b border-slate-100 py-1">${m.value.trim()}</td>
            <td class="border-b border-slate-100 py-1">${(doses[i] && doses[i].value.trim()) || '—'}</td>
            <td class="border-b border-slate-100 py-1">${(days[i] && days[i].value.trim()) || '—'}</td>
          `;
                rxTable.appendChild(tr);
            }
        });
        if (!hasRx) {
            rxTable.innerHTML = '<tr><td colspan="3" class="py-1 text-slate-400">No medicines prescribed</td></tr>';
        }

        // Pharmacy
        const cost = val('medicineCost');
        fill('s_medicineCost', cost ? ('Rs. ' + cost) : '', '—');
        fill('s_medicinePaymentStatus', val('medicinePaymentStatus'));
        fill('s_dispensed', val('dispensed'));

        document.getElementById('printOverlay').classList.remove('hidden');
    }

    function closeSummary() {
        document.getElementById('printOverlay').classList.add('hidden');
    }
</script>
</body>
</html>